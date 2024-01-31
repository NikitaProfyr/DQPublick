import smtplib
import ssl
from email.message import EmailMessage

from dotenv import load_dotenv
from os import getenv

load_dotenv()


def send_message_ibd():
    smtp_server = "smtp.yandex.ru"
    mail = 'IBDCorporation@yandex.ru'
    password = getenv('MAIL_PASS')
    port = 587   # используйте порт 465 для SSL

    msg = EmailMessage()
    msg.set_content('Аджарагуджу from IBDCorparation kuuurvaaaa')
    msg['Subject'] = 'Subject line'
    msg['From'] = 'IBDCorporation@yandex.ru'
    msg['To'] = 'neicker44536@gmail.com'

    try:
        server = smtplib.SMTP(smtp_server, port)
        server.starttls()
        server.login(mail, password)
        server.send_message(msg)
        server.quit()
    except Exception as es:
        print(es)
