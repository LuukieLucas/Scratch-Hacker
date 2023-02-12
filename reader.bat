@echo off
color 02
set var=0
cls
set own=%cd%

:permachecker
if exist "%own%\user.config" goto b
goto start
:b
if exist "%own%\studio.config" goto perma
goto start

:perma
set /p user=<user.config
set /p studio=<studio.config
goto permastart

:start
set /p user=user: 
set /p studio=studio: 
cls
:permastart
mkdir %user%
mkdir %studio%
set studiofile=studio %studio%
set studiocommentsfile=studio comments %studio%
set userfile=user %user%
set projectsfile=projects %user%
set followingfile=following %user%
set followersfile=followers %user%
set usermessagesfile=messages %user%
del /Q /F /S "%own%\log.log"
:l
set /A var=var+1
set currentpth=%own%\%user%
cd "%currentpth%"
curl "https://api.scratch.mit.edu/users/%user%?limit=1&offset=%var%" > "%userfile% %var%.txt"
echo saved projects to "%userfile% %var%.txt"
cd %own%
echo saved projects to "%userfile% %var%.txt" >> log.log
cd "%currentpth%"

curl "https://api.scratch.mit.edu/users/%user%/projects?limit=1&offset=%var%" > "%projectsfile% %var%.txt"
echo saved projects to "%projectsfile% %var%.txt"
cd %own%
echo saved projects to "%projectsfile% %var%.txt" >> log.log
cd "%currentpth%"

curl "https://api.scratch.mit.edu/users/%user%/following?limit=1&offset=%var%" > "%followingfile% %var%.txt"
echo saved projects to "%followingfile% %var%.txt"
cd %own%
echo saved projects to "%followingfile% %var%.txt" >> log.log
cd "%currentpth%"

curl "https://api.scratch.mit.edu/users/%user%/followers?limit=1&offset=%var%" > "%followersfile% %var%.txt"
echo saved projects to "%followersfile% %var%.txt"
cd %own%
echo saved projects to "%followersfile% %var%.txt" >> log.log
cd "%currentpth%"

curl "https://api.scratch.mit.edu/users/%user%/messages/count" >> "%usermessagesfile% %var%.txt"
echo saved studio projects 2 to "%usermessagesfile%"
cd %own%
echo saved studio projects 2 to "%usermessagesfile%" >> log.log
cd "%currentpth%"


set currentpth=%own%\%studio%
cd "%currentpth%"
curl "https://api.scratch.mit.edu/studios/%studio%/projects?limit=1&offset=%var%" > "%studiofile% %var%.txt"
echo saved studio projects to "%studiofile% %var%.txt"
cd %own%
echo saved studio projects to "%studiofile% %var%.txt" >> log.log
cd "%currentpth%"
echo. >> "%studiofile%"

curl "https://api.scratch.mit.edu/studios/%studio%?limit=1&offset=%var%" >> "%studiofile% %var%.txt"
echo saved studio projects 2 to "%studiofile% %var%.txt"
cd %own%
echo saved studio projects 2 to "%studiofile% %var%.txt" >> log.log
cd "%currentpth%"

curl "https://api.scratch.mit.edu/studios/%studio%/comments?limit=1&offset=%var%" >> "%studiocommentsfile% %var%.txt"
echo saved studio projects 2 to "%studiocommentsfile% %var%.txt"
cd %own%
echo saved studio projects 2 to "%studiocommentsfile% %var%.txt" >> log.log
cd "%currentpth%"

goto l