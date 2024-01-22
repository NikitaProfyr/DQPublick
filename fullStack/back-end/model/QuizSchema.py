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


class QuizResult(BaseModel):
    id: int
    userId: int
    result: int
    quiz: QuizBaseSchema
