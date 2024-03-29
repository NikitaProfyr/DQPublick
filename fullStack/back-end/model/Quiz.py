from fastapi import Depends

from model.Settings import Base, get_db
from sqlalchemy import Column, ForeignKey, Integer, String, BOOLEAN, func, and_
from sqlalchemy.orm import relationship, Session


class Answer(Base):
    __tablename__ = "Answer"

    id = Column(Integer, autoincrement=True, primary_key=True, nullable=False)
    title = Column(String, nullable=False)
    right = Column(BOOLEAN, nullable=False)

    questionId = Column(Integer, ForeignKey("Question.id", ondelete="CASCADE"))
    question = relationship(
        "Question",
        back_populates="answer",
        cascade="save-update, merge, refresh-expire",
        overlaps="Answer.question",
    )

    def __str__(self):
        return f'{self.id} {self.title}'


class Question(Base):
    __tablename__ = "Question"

    id = Column(Integer, autoincrement=True, primary_key=True, nullable=False)
    title = Column(String, nullable=False)

    quizId = Column(Integer, ForeignKey("Quiz.id", ondelete="CASCADE"))
    quiz = relationship(
        "Quiz",
        back_populates="question",
        cascade="save-update, merge, refresh-expire",
        overlaps="Question.quiz",
    )

    answer = relationship(
        "Answer",
        back_populates="question",
        cascade="all, delete",
        overlaps="Question.answer",
    )

    def __str__(self):
        return f'{self.id} {self.title}'


    def count_right_answer(self, db: Session = Depends(get_db)):
        return (
            db.query(func.count(Answer.id))
            .filter(and_(Answer.questionId == self.id, Answer.right == True))
            .scalar()
        )


class Quiz(Base):
    __tablename__ = "Quiz"

    id = Column(Integer, autoincrement=True, primary_key=True, nullable=False)
    title = Column(String, nullable=False)
    description = Column(String, nullable=False)
    image = Column(String, nullable=True)

    authorId = Column(Integer, ForeignKey("User.id", ondelete="CASCADE"))

    author = relationship(
        "User", back_populates="quiz", cascade="save-update, merge, refresh-expire", overlaps="User"
    )
    question = relationship(
        "Question", back_populates="quiz", cascade="all, delete", passive_deletes=True
    )

    def __str__(self):
        return f'{self.id} {self.title}'


class QuizResults(Base):
    __tablename__ = "QuizResults"

    id = Column(Integer, autoincrement=True, primary_key=True, nullable=False)
    userId = Column(Integer, ForeignKey("User.id", ondelete="CASCADE"))
    quizId = Column(Integer, ForeignKey("Quiz.id", ondelete="CASCADE"))
    result = Column(Integer)

    user = relationship("User", backref="QuizResults")
    quiz = relationship("Quiz", backref="QuizResults")
