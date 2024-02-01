from typing import List


from pydantic import BaseModel


class AnswerSchema(BaseModel):
    id: int
    title: str
    right: bool


class QuestionSchema(BaseModel):
    id: int
    title: str
    answer: List[AnswerSchema]


class QuizBaseSchema(BaseModel):
    id: int
    title: str
    description: str
    image: str


class QuizSchema(QuizBaseSchema):
    id: int
    title: str
    description: str
    image: str
    question: List[QuestionSchema]


class AnswerGameSchema(BaseModel):
    id: int
    title: str


class QuestionGameSchema(BaseModel):
    id: int
    title: str
    answer: List[AnswerGameSchema]


class QuizGameSchema(QuizBaseSchema):
    id: int
    title: str
    description: str
    image: str
    question: List[QuestionGameSchema]


class GameResponseSchema(BaseModel):
    quiz: QuizGameSchema
    count_right_answer: list


class QuizResult(BaseModel):
    id: int
    userId: int
    result: int
    quiz: QuizBaseSchema
