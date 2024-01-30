import smtplib
import ssl
from email.message import EmailMessage


def get_smtp_obj():
    smtp_obj = smtplib.SMTP('smtp.ibdcorporation31@gmail.com', 587)
    try:
        smtp_obj.starttls()

        smtp_obj.login('ibdcorporation31@gmail.com', 'Ee123123Ee')
        yield smtp_obj
    finally:
        smtp_obj.quit()


def send_message_ibd(message: str, email: str):
    smtp_server = "smtp.gmail.com"
    port = 465   # используйте порт 465 для SSL 587
    # server = smtplib.SMTP(smtp_server, port, )
    # server.starttls()
    msg = EmailMessage()
    msg.set_content(message)
    msg['Subject'] = 'Subject line'
    msg['From'] = 'IBDCorporation31@gmail.com'
    msg['To'] = 'toporov.axeman@gmail.com'

    context = ssl.create_default_context()
    with smtplib.SMTP(smtp_server, port) as server:
        server.starttls(context=context)  # Устанавливаем защищенное соединение
        server.login('IBDCorporation31@gmail.com', 'Ee123123Ee')
        server.send_message(msg)

    # server.login('IBDCorporation31@gmail.com', 'Ee123123Ee')
    #
    # server.sendmail('ibdcorporation31@gmail.com', 'toporov.axeman@gmail.com', 'Аджарагуджу from IBDCorparation kuuurvaaaa')
    #
    # server.quit()