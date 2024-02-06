import smtplib
from smtplib import SMTP
from os import getenv

from dotenv import load_dotenv


load_dotenv()

smtp_server = getenv('SMTP_SERVER')
mail = getenv('MAIL_NAME')
password = getenv('MAIL_PASS')
port = int(getenv('MAIL_PORT'))


def get_smtp_server() -> SMTP:
    server = smtplib.SMTP(smtp_server, port, timeout=10)
    try:
        server.starttls()
        server.login(mail, password)
        return server
    except Exception as es:
        print(es)
