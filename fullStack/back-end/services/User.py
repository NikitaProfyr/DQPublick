from datetime import timedelta, datetime
from typing import Annotated

from fastapi import HTTPException, Depends
from fastapi import Request
from jose import jwt, JWTError
from sqlalchemy import select, update, delete, or_, and_
from sqlalchemy.orm import Session
from starlette import status
from starlette.status import HTTP_400_BAD_REQUEST, HTTP_401_UNAUTHORIZED, HTTP_200_OK, HTTP_404_NOT_FOUND

from model.Settings import get_db
from model.User import User, Token
from model.UserSchema import (
    UserBase,
    UserCreate,
    UserUpdate,
    UserId,
    UpdatePasswordSchema, ChangePasswordSchema,
)
from security import pwdContext, SECRET_KEY, ALGORITHM, oauth2Scheme


def get_user(db: Session, user_data: UserBase):
    user = db.scalar(select(User).where(or_(User.userName == user_data.userName)))
    if not user:
        raise HTTPException(
            status_code=HTTP_400_BAD_REQUEST,
            detail="Пользователь с таким именем не найден.",
        )
    return user


def create_user(db: Session, user_data: UserCreate):
    if db.scalar(select(User).where(or_(User.userName == user_data.userName))):
        raise HTTPException(
            status_code=HTTP_400_BAD_REQUEST,
            detail="Пользователь с таким именем уже зарегистрирован",
        )
    hashed_password = pwdContext.hash(user_data.password)
    user = User(userName=user_data.userName)
    user.hashedPassword = hashed_password
    db.add(user)
    db.commit()
    return user


def authenticated(db: Session, user_data: UserCreate):
    user = get_user(db=db, user_data=user_data)
    if not user:
        raise HTTPException(
            status_code=HTTP_400_BAD_REQUEST,
            detail="Пользователь с таким именем не найден",
        )
    if not pwdContext.verify(user_data.password, user.hashedPassword):
        raise HTTPException(
            status_code=HTTP_400_BAD_REQUEST, detail="Не правильный пароль"
        )
    return user


def create_token(data: dict, expires_delta: timedelta | None = None):
    to_encode = data.copy()
    if expires_delta:
        expire = datetime.utcnow() + expires_delta
    else:
        expire = datetime.utcnow() + timedelta(minutes=15)
    to_encode.update({"exp": expire})
    encoded_jwt = jwt.encode(to_encode, SECRET_KEY, algorithm=ALGORITHM)
    return encoded_jwt


def delete_refresh_token(token: str, db: Session = Depends(get_db)):
    db.execute(delete(Token).where(or_(Token.refreshToken == token)))
    db.commit()


def save_refresh_token(
    user_data: UserCreate, token: str, db: Session = Depends(get_db)
):
    user = get_user(db=db, user_data=user_data)

    refresh_token = db.scalar(select(Token).where(or_(Token.userId == user.id)))
    if refresh_token:
        refresh_token.refreshToken = token
    else:
        refresh_token = Token(refreshToken=token, userId=user.id)
    db.add(refresh_token)
    db.commit()


def select_current_token(
    user_id: str, db: Session = Depends(get_db)
) -> str:  # не используется
    refresh_token = db.scalar(select(Token).where(or_(user_id == user_id)))
    if not refresh_token:
        raise HTTP_400_BAD_REQUEST
    return refresh_token


def validate_refresh_token(token: str, db: Session = Depends(get_db)):
    try:
        payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
        return payload
    except JWTError:
        return None


def delete_user(request: Request, db: Session = Depends(get_db)):
    try:
        db.execute(
            delete(User).where(
                or_(User.id == get_user_id_by_token(request=request, db=db))
            )
        )
        db.commit()
        return HTTP_200_OK
    except HTTPException:
        return HTTPException(status_code=HTTP_400_BAD_REQUEST)


def get_user_id_by_token(request: Request, db: Session = Depends(get_db)):
    refresh_token = request.cookies.get("refreshToken")
    token = db.scalar(select(Token).where(or_(Token.refreshToken == refresh_token)))
    if token is None:
        raise HTTPException(status_code=404, detail="Токен не найден")

    return token.userId


def get_current_user(
    token: Annotated[str, Depends(oauth2Scheme)],
    # token: str,
    db: Session = Annotated[str, Depends(get_db)],
):
    credentials_exception = HTTPException(
        status_code=status.HTTP_401_UNAUTHORIZED,
        detail="Не удалось проверить учетные данные",
        headers={"WWW-Authenticate": "Bearer"},
    )
    try:
        payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
        user_name = payload.get("userName")
        if not user_name:
            raise credentials_exception
        token_data = UserBase(userName=user_name)
    except JWTError:
        raise credentials_exception
    user = get_user(db=db, user_data=token_data)
    if not user:
        raise credentials_exception
    return user


def update_user(request: Request, db: Session, user: UserUpdate):
    id_user = get_user_id_by_token(request=request, db=db)
    existing_user = db.execute(
        select(User).where(
            or_(User.userName == user.userName, User.email == user.email)
        )
    ).scalar()
    if existing_user and existing_user.id != id_user:
        raise HTTPException(
            status_code=400,
            detail="Пользователь с таким именем или email уже существует.",
        )

    try:
        query = (
            update(User)
            .where(or_(User.id == id_user))
            .values(
                userName=user.userName,
                email=user.email,
            )
        )
        db.execute(query)
        db.commit()
        updated_user = db.execute(select(User).where(or_(User.id == id_user))).scalar()

        return updated_user

    except Exception as ex:
        print(Exception)
        db.rollback()
        raise HTTPException(
            status_code=500, detail="Произошла ошибка при обновлении пользователя."
        ) from ex


def update_password(
    request: Request, user_data: UpdatePasswordSchema, db: Session = Depends(get_db)
):
    id_user = get_user_id_by_token(request=request, db=db)
    user = db.scalar(select(User).where(or_(User.id == id_user)))
    if not pwdContext.verify(user_data.oldPassword, user.hashedPassword):
        raise HTTPException(
            status_code=HTTP_401_UNAUTHORIZED, detail="Не правильный пароль"
        )
    user.hashedPassword = pwdContext.hash(user_data.newPassword)
    db.commit()
    return HTTP_200_OK


def update_password_by_email(change_data: ChangePasswordSchema, db: Session = Depends(get_db)):
    user = db.scalar(select(User).where(or_(User.rndstr == change_data.rndstr)))
    if not user:
        raise HTTPException(
            status_code=HTTP_404_NOT_FOUND,
            detail="Ссылка не действительна"
        )
    user.hashedPassword = pwdContext.hash(change_data.password)
    user.rndstr = None
    db.commit()
    return HTTP_200_OK