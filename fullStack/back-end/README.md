# Для работы с миграциями


### Чтобы создать миграцию:
- alembic revision --autogenerate -m 'comment' -
данная команда создаст файл с миграцией
- alembic upgrade head - создаст таблицы в бд

### Для работы с дампом бд: https://help.sweb.ru/entry/113/

### Для подключения к удаленному репозиторию: 
git remote add origin https://github.com/NikitaProfyr/DragonQuestion.git
git branch -M main
git push -u origin main

### Для поключения celery и flower:
celery -A tasks.task:celeryApp worker --loglevel=INFO --pool=solo  
celery -A tasks.task:celeryApp flower

### Для поключения запуска docker-compose

docker compose up --build dq-client


migration/env.py
model/Settings.py
mian.py # Redis
Alembic.ini