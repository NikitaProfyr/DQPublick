"""
Регистрация моделей для миграций.
Импортируй свои классы моделей(таблицы) сюда, прежде чем начать миграции
"""

from model.Settings import Base
from model.User import User, Token
from model.Quiz import Answer, Question, Quiz
