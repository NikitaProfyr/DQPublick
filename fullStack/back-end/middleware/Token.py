from sqlalchemy.orm import Session
from starlette.requests import Request
from starlette.responses import Response

from fastapi import Request, Depends, HTTPException

from model.Settings import get_db
from services.User import get_current_user


def CheckAuthMiddleware(
    request: Request, response: Response, db: Session = Depends(get_db)
):
    print("==================midleware========================")
    authorizationHeader = request.headers.get("Authorization")
    if not authorizationHeader:
        raise HTTPException(
            status_code=401,
            detail="Пользователь не авторизован",
        )
    user = get_current_user(token=authorizationHeader, db=db)
    if not user:
        raise HTTPException(
            status_code=401,
            detail="Пользователь не авторизован",
        )
