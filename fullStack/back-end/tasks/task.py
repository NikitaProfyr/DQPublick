from celery import Celery

celeryApp = Celery("tasks", broker="redis://127.0.0.1:6379")



