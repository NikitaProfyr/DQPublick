
from fastapi import FastAPI, Request, Depends
from fastapi_cache.backends.redis import RedisBackend


from fastapi_cache import FastAPICache
from redis import asyncio as aioredis
from fastapi.middleware.cors import CORSMiddleware

from routers.UserRouter import user_public_router, user_private_router
from routers.QuizRouter import quiz_private_router, quiz_public_router
from dotenv import load_dotenv
from os import getenv

from fastapi_pagination import add_pagination

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
        f"redis://{getenv('REDIS_HOST')}", encoding="utf8", decode_responses=True
    )
    FastAPICache.init(RedisBackend(redis), prefix="fastapi-cache")


app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:3000"],
    allow_credentials=True,  # Разрешить отправлять куки
    allow_methods=["POST", "GET", "DELETE", "PUT"],  # Разрешить любые HTTP-методы
    allow_headers=["*"],  # Разрешить любые заголовки
)


