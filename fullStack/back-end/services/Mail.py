import smtplib


def get_smtp_obj():
    smtp_obj = smtplib.SMTP('smtp.ibdcorporation31@gmail.com', 587)
    try:
        smtp_obj.starttls()

        smtp_obj.login('ibdcorporation31@gmail.com', 'Ee123123Ee')
        yield smtp_obj
    finally:
        smtp_obj.quit()

