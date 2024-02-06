import smtplib
from smtplib import SMTP
import random, string
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText

from fastapi import Depends, HTTPException
from sqlalchemy import select, or_
from sqlalchemy.orm import Session

from dotenv import load_dotenv
from os import getenv

from starlette.status import HTTP_404_NOT_FOUND, HTTP_200_OK

from model.Settings import get_db
from model.User import User
from model.UserSchema import UserEmail
from settings.MailSettings import get_smtp_server

load_dotenv()


def get_html(rndstr):
    return f"""
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Восстановление пароля</title>
    <style>
        body {{
            font-family: Montserrat, sans-serif;
            background: rgb(191, 191, 191);
           background: linear-gradient(135deg, rgba(191, 191, 191, 0.35) 0%, rgba(214, 90, 194, 0.3) 100%);
            color: #fff; /* Белый цвет шрифта */
        }}
        h1 {{
            color: #1e90ff; /* Голубой цвет заголовка */
        }}
        a {{
            color: #1e90ff; /* Голубая ссылка */
            text-decoration: none;
            transition: color 0.3s ease; /* Плавное изменение цвета при наведении */
        }}
        a:hover {{
            color: #ff69b4; /* Розовый цвет при наведении */
        }}
        a:active {{
            color: #ff4500; /* Оранжевый цвет при активации (нажатии) */
        }}
    </style>
</head>
<body>
    <h1>Восстановление пароля</h1>
    <p>Здравствуйте! Вы забыли свой пароль? Не волнуйтесь, мы поможем вам его восстановить.</p>
    <p>Для этого перейдите по следующей ссылке:</p>
    <a href="{getenv("SITE_HOST")}/change-password/{rndstr}">{getenv("SITE_HOST")}/change-password/{rndstr}</a>
    <p>На странице восстановления пароля вам нужно будет ввести новый пароль и повторить его для подтверждения.</p>
    <p>Если вы не запрашивали восстановление пароля, проигнорируйте это сообщение.</p>
    <p>Если у вас возникли вопросы, свяжитесь с нашей службой поддержки.</p>
    <p>С уважением, IBD Corporation</p>
</body>
</html>
"""


def send_message_ibd(email: UserEmail, db: Session = Depends(get_db)):

    user = db.scalar(select(User).where(or_(User.email == email.email)))
    if not user:
        raise HTTPException(
            status_code=HTTP_404_NOT_FOUND,
            detail="Пользователя с данной почтой не существует."
        )
    else:
        rndstr = generate_rndstr()
        user.rndstr = rndstr
        db.commit()
        server = get_smtp_server()
        try:
            html_content = get_html(rndstr)
            message = get_message(html_content, email.email)
            server.send_message(message, to_addrs=email.email)
        except Exception as es:
            print(es)
        finally:
            server.quit()

    return HTTP_200_OK


def generate_rndstr():
    characters = string.ascii_letters + string.digits
    return ''.join(random.choice(characters) for i in range(31))


def get_message(text_html: str, to_addres: str) -> MIMEMultipart:
    msg = MIMEMultipart()
    msg.attach(MIMEText(text_html, 'html'))
    msg['Subject'] = 'Subject line'
    msg['From'] = 'IBDCorporation@yandex.com'
    msg['To'] = f'{to_addres}'
    return msg
