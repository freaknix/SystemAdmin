#!/usr/bin/python3

import shutil
import psutil
import datetime
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
import requests, datetime

email_sender_account = "ashabbir@egenienext.com" #your email
email_sender_username = "ashabbir@egenienext.com"  #your email username
email_sender_password = "eGn3xt$#@!"#your email password
email_smtp_server = "mail.egenienext.com" #change if not gmail.
email_smtp_port = 587 #change if needed.
email_recepients = ["ashabbir@egenienext.com"] #your receipts

def SendEmail ():
    email_subject = f"Reporting Malgrow Server Status at {datetime.datetime.now()}"
    email_body = '<html><head></head><body>'
    email_body += '<style type="text/css"></style>' 
    email_body += f'<h2>Reporting Malgrow Server Status {datetime.datetime.now()}</h2>' 
    #confirmed cases
    email_body += f'<h1 style="color: rgb(86, 0, 251);">' 
    email_body += f'<b>Malgrow Production server RAM Critical</b>: ' 
    server = smtplib.SMTP(email_smtp_server,email_smtp_port) 
    print(f"Logging in to {email_sender_account}")
    server.starttls() 
    server.login(email_sender_username, email_sender_password)
    for recipient in email_recepients:
        print(f"Sending email to {recipient}")
        message = MIMEMultipart('alternative') 
        message['From'] = email_sender_account 
        message['To'] = recipient 
        message['Subject'] = email_subject 
        message.attach(MIMEText(email_body, 'html')) 
        server.sendmail(email_sender_account,recipient,message.as_string())
    server.quit()

print("Today's date is = ",datetime.datetime.now())


free = psutil.virtual_memory()[2]


if free > 0:
    SendEmail()

print(f"End")
