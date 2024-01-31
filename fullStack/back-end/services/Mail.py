import smtplib

from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText

from dotenv import load_dotenv
from os import getenv

load_dotenv()

html_content = """
<!DOCTYPE html>
<html>
<head>
    <title>Форма восстановления пароля</title>
</head>
<body>
    <h2>Восстановление пароля</h2>
    <form id="reset-pass" method="post">
        <div>
            <label for="password">пароль:</label>
            <input type="password" id="pass" name="password" required>
        </div>
        <div>
            <input type="submit" value="Отправить пароль">
        </div>
    </form>
    <script>
    console.log("123");
    document.getElementById('reset-pass').addEventListener('submit', async (event) => {
        event.preventDefault();
        console.log("123")
    });
    </script>
</body>
</html>
"""

def send_message_ibd():
    smtp_server = "smtp.yandex.com"
    mail = 'IBDCorporation@yandex.com'
    password = getenv('MAIL_PASS')
    port = 587   # используйте порт 465 для SSL
    msg = MIMEMultipart()

    msg['Subject'] = 'Subject line'
    msg['From'] = 'IBDCorporation@yandex.com'
    msg['To'] = 'neicker44536@gmail.com'

    try:
        server = smtplib.SMTP(smtp_server, port, timeout=10)
        server.starttls()
        server.login(mail, password)
        msg.attach(MIMEText(html_content, 'html'))
        server.send_message(msg, from_addr='IBDCorporation@yandex.com', to_addrs='neicker44536@gmail.com')
        server.quit()
    except Exception as es:
        print(es)

