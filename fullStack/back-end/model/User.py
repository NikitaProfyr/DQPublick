from sqlalchemy.orm import relationship
from model.Settings import Base
from sqlalchemy import Column, Integer, String, ForeignKey


class User(Base):
    __tablename__ = "User"

    id = Column(Integer, primary_key=True, autoincrement=True)
    email = Column(String, nullable=True, unique=True)
    hashedPassword = Column(String)
    userName = Column(String, unique=True)

    Token = relationship("Token", back_populates="User", cascade="all, delete")
    quiz = relationship("Quiz", backref="User")


class Token(Base):
    __tablename__ = "Token"

    id = Column(Integer, primary_key=True, index=True)
    refreshToken = Column(String, unique=True, index=True)
    userId = Column(Integer, ForeignKey("User.id", ondelete="CASCADE"))
    User = relationship("User", back_populates="Token")
