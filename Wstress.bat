:: Wstress is a batch script to spam a discord webhook with a simple interface, you can send a lot of message
:: Wstress was Created by AfraL : https://github.com/Its-AfraL
:: Thank you for use, this is a opensource project you can say things to change on github repositorie

:: How it work ?
:: Wstress will create a spammer.py file who use request python module to spam the webhook, it's a simple script
:: How to install Wstress ?
:: To install Wstress, make sure you have python installed on your computer and start install.bat file

:: Update historic :
:: Finished at 30/06/2021 : Created the script Wstress

@echo off

echo.
echo 		 _    _      _                     
echo 		^| ^|  ^| ^|    ^| ^|                    
echo 		^| ^|  ^| ^| ___^| ^|_ _ __ ___  ___ ___ 
echo 		^| ^|/\^| ^|/ __^| __^| '__/ _ \/ __/ __^|  https://github.com/Its-AfraL
echo 		\  /\  /\__ \ ^|_^| ^| ^|  __/\__ \__ \  Wstress Created by AfraL
echo 		 \/  \/ ^|___/\__^|_^|  \___^|^|___/___/ 
echo.
timeout /nobreak /t 2 > nul

echo %time%  { * } Check python install... 
timeout /nobreak /t 1 > nul
python --version 2> nul | if %ERRORLEVEL% == 1 goto :no_python
goto :python_ok

:python_ok

echo %time%  { + } Python is installed ... 
echo.
timeout /nobreak /t 1 > nul
echo Enter the url of the webhook to spam him :
echo.

set /p webhook_url=^>^>^> 
echo.

echo Enter the text to spam :
echo.

set /p text_to_spam=^>^>^> 
echo.
timeout /t 1 /nobreak > NUL

echo %time%  { * } Creating the flood file...
timeout /t 1 /nobreak > NUL
echo import requests, os, platform, time > spammer.py
echo from colorama import Fore, Back, Style >> spammer.py
echo. >> spammer.py
echo webhook = "%webhook_url%" >> spammer.py
echo text = "%text_to_spam%" >> spammer.py
echo. >> spammer.py
echo data = { >> spammer.py
echo     "content": text # data for webhook as json >> spammer.py
echo } >> spammer.py
echo def send(i): >> spammer.py
echo     res = requests.post(webhook, data=data) # sends data to webhook >> spammer.py
echo     try: >> spammer.py
echo         print(Fore.RED + 'getting ratelimited, waiting ' + str(res.json()["retry_after"]) + 'ms.') >> spammer.py
echo         # response: {'global': False, 'message': 'You are being rate limited.', 'retry_after': 12345)} >> spammer.py
echo         time.sleep(res.json()["retry_after"]/1000) >> spammer.py
echo         res = 'waited ' + Fore.RED + str(res.json()["retry_after"]) + 'ms.' >> spammer.py
echo     except: >> spammer.py
echo         i += 1 >> spammer.py
echo         res = "Sent message " + text + " successful." >> spammer.py
echo     print(Fore.MAGENTA + res + Fore.MAGENTA + ' Amount of messages already sent: ' + Fore.CYAN + str(i)) # message for feedback lol >> spammer.py
echo     return i >> spammer.py
echo i = 0 >> spammer.py
echo while True: #loop >> spammer.py
echo    i = send(i) >> spammer.py

echo %time%  { + } Created with sucess 
echo.
timeout /t 1 /nobreak > nul
echo %time%  { * } Starting to spam the webhook...

echo.
py spammer.py
echo.

echo %time%  { * } Spamming is finish, press ENTER to leave

pause > nul

exit /b
