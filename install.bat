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

echo %time%  { * } Installing all dependencies...
timeout /nobreak /t 1 > nul

pip install requests
pip install colorama
pip install discord
pip install discord_webhook
echo.
echo.
echo %time%  { + } Wstress was correctly installed
echo.
pause 
