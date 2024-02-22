

from fastapi import FastAPI, Request, Depends
from fastapi_cache.backends.redis import RedisBackend

from fastapi_cache import FastAPICache
from redis import asyncio as aioredis
from fastapi.middleware.cors import CORSMiddleware


from model.Quiz import Quiz, Question, Answer
from model.UserSchema import UserCreate
from routers.UserRouter import user_public_router, user_private_router
from routers.QuizRouter import quiz_private_router, quiz_public_router
from dotenv import load_dotenv
from os import getenv

from fastapi_pagination import add_pagination

from security import SECRET_KEY
from services.User import authenticated, create_token

load_dotenv()

app = FastAPI(
    title="IBD App",
    description="IBD Corporation - perfect, fast, cheap.",
    contact={"name": "Toporov Denis, Profyr Nikita"},
)


add_pagination(app)

# регистрация роутеров

app.include_router(
    router=user_public_router,
    prefix="/users",
)

app.include_router(
    router=user_private_router,
    prefix="/users",
)

app.include_router(
    router=quiz_private_router,
)

app.include_router(
    router=quiz_public_router,
)


@app.on_event("startup")
async def startup_event():
    redis = aioredis.from_url(
        f"redis://{getenv('REDIS_HOST')}",
        encoding="utf8",
        decode_responses=True,
    )
    FastAPICache.init(RedisBackend(redis), prefix="fastapi-cache")


app.add_middleware(
    CORSMiddleware,
    allow_origins=[getenv("SITE_HOST"), "http://212.113.117.177:3000", "http://212.113.117.177:8080"],
    allow_credentials=True,  # Разрешить отправлять куки
    allow_methods=["POST", "GET", "DELETE", "PUT"],  # Разрешить любые HTTP-методы
    allow_headers=["*"],  # Разрешить любые заголовки
)

# ======================================================================
# Admin
# ======================================================================

from sqladmin import Admin, ModelView
from model.Settings import engine, get_db, SessionLocal
from model.User import User
from sqladmin.authentication import AuthenticationBackend
from starlette.requests import Request




class AdminAuth(AuthenticationBackend):
    async def login(self, request: Request) -> bool:
        form = await request.form()
        username, password = form["username"], form["password"]
        db = SessionLocal()
        user = authenticated(db=db, user_data=UserCreate(userName=username, password=password))
        if not user or user.isAdmin is None or user.isAdmin is False:
            return False

        access_token = create_token(data={"userName": user.userName})
        # Validate username/password credentials
        # And update session
        request.session.update({"token": access_token})

        return True

    async def logout(self, request: Request) -> bool:
        # Usually you'd want to just clear the session
        request.session.clear()
        return True

    async def authenticate(self, request: Request) -> bool:
        token = request.session.get("token")

        if not token:
            return False

        # Check the token in depth
        return True


authentication_backend = AdminAuth(secret_key=SECRET_KEY)
admin = Admin(app=app, engine=engine, authentication_backend=authentication_backend)


class UserAdmin(ModelView, model=User):
    column_list = [User.id, User.userName, User.email]
    column_details_exclude_list = [User.hashedPassword, User.rndstr, User.Token]
    column_searchable_list = [User.email, User.userName, User.id]


class QuizAdmin(ModelView, model=Quiz):
    column_list = [Quiz.id, Quiz.title]
    column_searchable_list = [Quiz.id, Quiz.title]


class QuestionAdmin(ModelView, model=Question):
    column_list = [Question.id, Question.title, Question.quizId]
    column_searchable_list = [Question.id, Question.title, Question.quizId]


class AnswerAdmin(ModelView, model=Answer):
    column_list = [Answer.id, Answer.title, Answer.questionId]
    column_searchable_list = [Answer.id, Answer.title, Answer.questionId]


admin.add_view(UserAdmin)
admin.add_view(QuizAdmin)
admin.add_view(QuestionAdmin)
admin.add_view(AnswerAdmin)
