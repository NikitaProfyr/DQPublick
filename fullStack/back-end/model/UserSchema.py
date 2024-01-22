from typing import Optional, List
from pydantic import BaseModel, EmailStr

from model.QuizSchema import QuizSchema


class UserSchema(BaseModel):
    id: int
    email: EmailStr
    hashedPassword: str
    userName: Optional[str] = None
    quiz: List[QuizSchema] = None

    class Config:
        from_attributes = True


class UserBase(BaseModel):
    userName: str


class UserCreate(UserBase):
    password: str


class UserLite(UserBase):
    id: int


class UserId(BaseModel):
    id: int


class UserUpdate(BaseModel):
    email: str
    userName: str


class TokenSchema(BaseModel):
    accesToken: str


class UpdatePasswordSchema(BaseModel):
    oldPassword: str
    newPassword: str
