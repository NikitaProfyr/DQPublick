from http.client import HTTPException

from fastapi import FastAPI, Request, Depends
from fastapi_cache.backends.redis import RedisBackend


from fastapi_cache import FastAPICache
from redis import asyncio as aioredis
from fastapi.middleware.cors import CORSMiddleware
from sqlalchemy.orm import Session
from starlette.status import HTTP_400_BAD_REQUEST

from model.UserSchema import UserCreate
from routers.UserRouter import user_public_router, user_private_router
from routers.QuizRouter import quiz_private_router, quiz_public_router
from dotenv import load_dotenv
from os import getenv

from fastapi_pagination import add_pagination

from security import SECRET_KEY
from services.User import authenticated, create_token

load_dotenv()

origins = [
    "http://localhost:3000",
    "http://localhost:3000/",
]


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
        # "redis://redis", encoding="utf8", decode_responses=True
        f"redis://{getenv('REDIS_HOST')}",
        encoding="utf8",
        decode_responses=True,
    )
    FastAPICache.init(RedisBackend(redis), prefix="fastapi-cache")


app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:3000"],
    allow_credentials=True,  # Разрешить отправлять куки
    allow_methods=["POST", "GET", "DELETE", "PUT"],  # Разрешить любые HTTP-методы
    allow_headers=["*"],  # Разрешить любые заголовки
)

# Admin

from sqladmin import Admin, ModelView
from model.Settings import engine, get_db
from model.User import User
from sqladmin.authentication import AuthenticationBackend
from starlette.requests import Request
from starlette.responses import RedirectResponse


class AdminAuth(AuthenticationBackend):
    async def login(self, request: Request, db: Session = Depends(get_db)) -> bool:
        form = await request.form()
        username, password = form["username"], form["password"]

        user = authenticated(db=db, user_data=UserCreate(userName=username, password=password))
        if not user or user.isAdmin == False:
            return False
            # raise HTTPException(
            #     status_code=HTTP_400_BAD_REQUEST,
            #     detail="Некорректное имя пользователя или пароль",
            #     headers={"WWW-Authenticate": "Bearer"},
            # )

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
admin = Admin(app=app, authentication_backend=authentication_backend)


class UserAdmin(ModelView, model=User):
    column_list = [User.id, User.userName]


admin.add_view(UserAdmin)
