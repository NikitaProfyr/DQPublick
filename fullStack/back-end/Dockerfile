FROM python:3.10

ENV PYTHONUNBUFFERED 1

# Создание и переход в рабочую директорию

WORKDIR /back-end/

COPY requirements.txt requirements.txt
COPY . .

RUN pip install --upgrade pip
RUN pip install -r requirements.txt