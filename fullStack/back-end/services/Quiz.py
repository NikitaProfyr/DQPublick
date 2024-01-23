import shutil

import os

from fastapi_pagination import add_pagination
from fastapi_pagination.ext.sqlalchemy import paginate
from sqlalchemy.orm import Session, joinedload
from starlette import status

from model.QuizSchema import QuestionSchema, QuizSchema, AnswerSchema
from model.Quiz import Question, Quiz, Answer, QuizResults
from model.Settings import get_db
from sqlalchemy import select, delete, update, and_, asc, or_
from fastapi import HTTPException, Depends, UploadFile, File, Form, Request
from starlette.status import HTTP_400_BAD_REQUEST, HTTP_201_CREATED

from model.UserSchema import UserId
from services.User import get_user_id_by_token


def create_answer(
    id_question: int, anwer_data: AnswerSchema, db: Session = Depends(get_db)
):
    anwer = Answer(title=anwer_data.title, right=anwer_data.right, questionId=id_question)
    db.add(anwer)
    db.commit()


def create_question(
    id_quiz: int, question_data: QuestionSchema, db: Session = Depends(get_db)
):
    question = Question(title=question_data.title, quizId=id_quiz)
    db.add(question)
    db.commit()

    for item_answer in question_data.answer:
        create_answer(id_question=question.id, anwer_data=item_answer, db=db)


def create_quiz(quiz_data: QuizSchema, request: Request, db: Session = Depends(get_db)):
    id_user = get_user_id_by_token(request=request, db=db)
    quiz = Quiz(
        title=quiz_data.title,
        description=quiz_data.description,
        image=quiz_data.image,
        authorId=id_user,
    )
    db.add(quiz)
    db.commit()

    for item in quiz_data.question:
        create_question(id_quiz=quiz.id, question_data=item, db=db)


def create_quiz_results(request: Request, quiz_id: int, result: int, db: Session = Depends(get_db)):
    id_user = get_user_id_by_token(request=request, db=db)
    quiz = db.scalar(
        select(QuizResults).where(
            and_(QuizResults.userId == id_user, QuizResults.quizId == quiz_id)
        )
    )
    if quiz:
        quiz.result = result
    else:
        quiz = QuizResults(userId=id_user, quizId=quiz_id, result=result)

    db.add(quiz)
    db.commit()


def delete_current_quiz(quiz_data: int, request: Request, db: Session = Depends(get_db)):
    id_user = get_user_id_by_token(request=request, db=db)
    quiz_check = db.scalar(
        select(Quiz).where(and_(Quiz.id == quiz_data, Quiz.authorId == id_user))
    )
    if not quiz_check:
        return HTTP_400_BAD_REQUEST
    quiz = delete(Quiz).where(and_(Quiz.id == quiz_data, Quiz.authorId == id_user))
    delete_image(quiz_check.image)
    db.execute(quiz)
    db.commit()


def delete_question(question_id: int, db: Session = Depends(get_db)):
    query = delete(Question).where(Question.id == question_id)
    db.execute(query)
    db.commit()


def delete_question_current_quiz(quiz_id, db: Session = Depends(get_db)):
    query = delete(Question).where(or_(Question.quizId == quiz_id))
    db.execute(query)
    db.commit()


def select_quiz_joined(db: Session = Depends(get_db)):
    quiz = (
        db.query(Quiz)
        .options(joinedload(Quiz.question).joinedload(Question.answer))
        .all()
    )
    return quiz


def select_quiz(db: Session = Depends(get_db)):
    return paginate(conn=db, query=select(Quiz).order_by(Quiz.id))


def select_current_quiz(id_quiz: int, db: Session = Depends(get_db)):
    current_quiz = db.scalar(select(Quiz).where(Quiz.id == id_quiz))
    if not current_quiz:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail=f"Опрос с идентифекатором: '{id_quiz}', не найден.",
        )
    return current_quiz


def select_user_quiz(request: Request, db: Session = Depends(get_db)):
    id_user = get_user_id_by_token(request=request, db=db)
    query = select(Quiz).where(or_(Quiz.authorId == id_user)).order_by(Quiz.id)
    return paginate(conn=db, query=query)


def select_quiz_results_user(request: Request, db: Session = Depends(get_db)):
    id_user = get_user_id_by_token(request=request, db=db)
    quiz = (
        db.query(QuizResults)
        .options(joinedload(QuizResults.quiz))
        .where()
        .all()
    )

    return paginate(conn=db, query=select(QuizResults).where(and_(
        QuizResults.userId == id_user, QuizResults.quizId == Quiz.id
    )))


def delete_image(imageUrl: str):
    if os.path.isfile(imageUrl):
        os.remove(imageUrl)


def create_image_quiz(image: UploadFile = File(...)):
    img_path = "media/quizImage/"
    with open(f"{img_path}{image.filename}", "wb") as buffer:
        shutil.copyfileobj(image.file, buffer)
    return img_path + image.filename


def update_image_quiz(
    quiz_id: int = Form(...),
    image: UploadFile = File(...),
    db: Session = Depends(get_db),
):
    quiz = db.scalar((select(Quiz).where(Quiz.id == quiz_id)))
    delete_image(imageUrl=quiz.image)
    return create_image_quiz(image=image)


def update_current_quiz(quiz_data: QuizSchema, db: Session = Depends(get_db)):
    query = (
        update(Quiz)
        .where(Quiz.id == quiz_data.id)
        .values(
            title=quiz_data.title, description=quiz_data.description, image=quiz_data.image
        )
    )
    delete_question_current_quiz(quiz_id=quiz_data.id, db=db)
    for item in quiz_data.question:
        create_question(id_quiz=quiz_data.id, question_data=item, db=db)
    db.execute(query)
    db.commit()
