from typing import List

from fastapi import APIRouter, Depends, UploadFile, File, Form, Request
from fastapi_cache.decorator import cache
from sqlalchemy.orm import Session
from starlette.responses import FileResponse

from middleware.Token import CheckAuthMiddleware
from model.QuizSchema import QuizSchema, QuizBaseSchema, QuizResult, QuizGameSchema, GameResponseSchema, \
    QuestionGameSchema
from model.Settings import get_db
from services.Quiz import (
    select_current_quiz,
    delete_current_quiz,
    select_user_quiz,
    create_image_quiz,
    update_current_quiz,
    update_image_quiz,
    select_quiz,
    create_quiz_results,
    select_quiz_results_user,
    create_quiz, select_current_quiz_without_right_answer, check_answers_user,
)

from fastapi_pagination import Page

quiz_private_router = APIRouter(
    prefix="/quiz", tags=["QuizPrivate"], dependencies=[Depends(CheckAuthMiddleware)]
)
quiz_public_router = APIRouter(prefix="/quiz-public", tags=["QuizPublic"])


@quiz_private_router.get("/quiz-list", response_model=Page[QuizBaseSchema])
@cache(expire=10)
def get_quiz(db: Session = Depends(get_db)):
    """Получить все опросы"""
    return select_quiz(db=db)


@quiz_private_router.get("/get-quiz/{id_quiz:int}")
def get_current_quiz(id_quiz: int, db: Session = Depends(get_db)) -> QuizSchema:
    """Получить конкретный опрос"""
    return select_current_quiz(id_quiz=id_quiz, db=db)


@quiz_private_router.get("/get-quiz-game/{id_quiz:int}")
def get_current_quiz_game(id_quiz: int, db: Session = Depends(get_db)) -> GameResponseSchema:
    """Получить конкретный опрос без обозначения правильности ответа"""
    return select_current_quiz_without_right_answer(id_quiz=id_quiz, db=db)


@quiz_private_router.get("/getquizuser", response_model=Page[QuizBaseSchema])
def get_user_quiz(
    request: Request, db: Session = Depends(get_db)
) -> Page[QuizBaseSchema] | None:
    """Получить созданные опросы конкретного пользователя"""
    return select_user_quiz(request=request, db=db)


@quiz_private_router.get("/result", response_model=Page[QuizResult])
def get_result_quiz_user(request: Request, db: Session = Depends(get_db)):
    """Получить опросы с результатом прохождения конкретного пользователя"""
    return select_quiz_results_user(request=request, db=db)


@quiz_public_router.get("/image/{url_image:path}", response_class=FileResponse)
def get_quiz_image(url_image: str):
    """Получить файл с изображением по путю"""
    return url_image


@quiz_private_router.post('/check/{quiz_id:int}')
def check_quiz(data: List[QuestionGameSchema], quiz_id: int, request: Request, db: Session = Depends(get_db)):

    result = check_answers_user(data=data, db=db)
    return create_quiz_results(request=request, quiz_id=quiz_id, result=result, db=db)


@quiz_private_router.post("/create-result")
def add_quiz_result(
    request: Request, quiz_id: int, result: int, db: Session = Depends(get_db)
):
    """Создать у конкретного пользователя результат прохождения опроса"""
    return create_quiz_results(request=request, quiz_id=quiz_id, result=result, db=db)


@quiz_public_router.post("/createquiz")
def add_quiz(quiz_data: QuizSchema, request: Request, db: Session = Depends(get_db)):
    """Создать опрос у конкретного пользователя"""
    return create_quiz(quiz_data=quiz_data, request=request, db=db)


@quiz_private_router.post("/download/image")
def download_image(image: UploadFile = File(...)):
    """Скачать файл с изображением в медия"""
    return create_image_quiz(image=image)


@quiz_private_router.put("/updatequiz")
def update_quiz(quiz_data: QuizSchema, db: Session = Depends(get_db)):
    """Обновить данные конкретного опроса"""
    return update_current_quiz(quiz_data=quiz_data, db=db)


@quiz_private_router.put("/update/image")
def update_image(
    quiz_id: int = Form(...),
    image: UploadFile = File(...),
    db: Session = Depends(get_db),
):
    """Обновить изображение у конкретного опроса"""
    return update_image_quiz(quiz_id=quiz_id, image=image, db=db)


@quiz_private_router.delete("/deletequiz/")
def remove_current_quiz(
    quiz_data: int, request: Request, db: Session = Depends(get_db)
):
    """Удалить конкретный опрос"""
    return delete_current_quiz(quiz_data=quiz_data, request=request, db=db)
