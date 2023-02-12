@echo off
color 02
title Combiner
cls

set own=%cd%

:permachecker
if exist "%own%\user.config" goto b
goto start
:b
if exist "%own%\studio.config" goto perma
goto noperma

:perma
set /p user=<user.config
set /p studio=<studio.config
goto start

:noperma
echo No perma detected!
echo Perma required.
pause >nul | echo Press any key to exit
exit

:start
set vara=0
set varb=1
:l
set /A vara=vara+1
set /A varb=varb+1
echo. > output.txt
cd %own%\%studio%
set file=%cd%\studio %studio%
copy /b "%own%\output.txt"+"%file% %vara%.txt"+"%file% %varb%.txt" "%own%\output.txt"
set file=studio comments %studio%
copy /b "%own%\output.txt"+"%file% %vara%.txt"+"%file% %varb%.txt" "%own%\output.txt"
cd %own%\%user%
set file=user %user%
copy /b "%own%\output.txt"+"%file% %vara%.txt"+"%file% %varb%.txt" "%own%\output.txt"
set file=projects %user%
copy /b "%own%\output.txt"+"%file% %vara%.txt"+"%file% %varb%.txt" "%own%\output.txt"
set file=following %user%
copy /b "%own%\output.txt"+"%file% %vara%.txt"+"%file% %varb%.txt" "%own%\output.txt"
set file=followers %user%
copy /b "%own%\output.txt"+"%file% %vara%.txt"+"%file% %varb%.txt" "%own%\output.txt"
set file=messages %user%
copy /b "%own%\output.txt"+"%file% %vara%.txt"+"%file% %varb%.txt" "%own%\output.txt"
goto l
