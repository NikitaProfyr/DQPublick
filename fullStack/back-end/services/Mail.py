import smtplib

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

load_dotenv()

html_content = """
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Восстановление</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f2f2f2;
      padding: 20px;
    }
    .container {
      max-width: 600px;
      margin: 0 auto;
      background-color: #ffffff;
      padding: 20px;
      border-radius: 5px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    h1 {
      color: #ff4d94;
    }
    p {
      color: #333333;
    }
    a {
      display: inline-block;
      padding: 10px 20px;
      margin-top: 20px;
      text-decoration: none;
      color: #ffffff;
      background-color: #4da6ff;
      border-radius: 5px;
    }
    img {
      max-width: 100%;
      height: auto;
      display: block;
      margin: 20px auto;
    }
  </style>
</head>
<body>
  <div class="container">
    <h1>Восстановление</h1>
    <p>Для восстановления пароля перейдите по следующей ссылке:</p>
    <a href="#">Восстановить пароль</a>
    <img src="IBDnew.svg" alt="логотип">
  </div>
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
        smtp_server = "smtp.yandex.com"
        mail = 'IBDCorporation@yandex.com'
        password = getenv('MAIL_PASS')
        port = 587   # используйте порт 465 для SSL
        msg = MIMEMultipart()

        msg['Subject'] = 'Subject line'
        msg['From'] = 'IBDCorporation@yandex.com'
        msg['To'] = f'{email.email}'

        try:
            server = smtplib.SMTP(smtp_server, port, timeout=10)
            server.starttls()
            server.login(mail, password)
            msg.attach(MIMEText(html_content, 'html'))
            server.send_message(msg, from_addr='IBDCorporation@yandex.com', to_addrs=f'{email.email}')
            server.quit()
        except Exception as es:
            print(es)
    return HTTP_200_OK

