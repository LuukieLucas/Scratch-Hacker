@echo off
color 02
cls
if exist "%cd%\user.config" goto a
goto continue
:a
if exist "%cd%\studio.config" goto del
goto error

:continue
set /p user=user: 
set /p studio=studio: 
::it took me really REALLY LONG to get a solution for this problem infecting curl:
::when writing a file with cmd, it adds an (enter) to the end of the file, spliting the url for curl
::and after i fixed that, it added a SPACE TO THE END OF THE FILE, so i had to fix that too
::BUT THEN IT JUST SAID "ECHO IS ON" AND I HAD TO 
::FIX
::THAT
::TOO
::now its 2:35 AM
>"%cd%\user.config" (
  echo | set /p dummyName=%user%
)
>"%cd%\studio.config" (
  echo | set /p dummyName=%studio%
)
cls
echo perma bookmarked!
pause >nul | echo Press any key to exit.
exit

:error
exit

:del
del /Q /F /S "%cd%\user.config"
del /Q /F /S "%cd%\studio.config"
cls
goto continue