from fastapi.security import APIKeyHeader
from passlib.context import CryptContext
from fastapi.security import OAuth2PasswordBearer
from os import getenv

from dotenv import load_dotenv

load_dotenv()

oauth2Scheme = OAuth2PasswordBearer(tokenUrl="token")

pwdContext = CryptContext(schemes=["bcrypt"], deprecated="auto")

apikeyScheme = APIKeyHeader(name="Authorization")


SECRET_KEY = f"{getenv('SECRET_KEY')}"
ALGORITHM = "HS256"

ACCESS_TOKEN_EXPIRE_MINUTES = 1
REFRESH_TOKEN_EXPIRE_DAYS = 30
