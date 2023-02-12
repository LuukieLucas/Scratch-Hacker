@echo off
color 02
title Compressor
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
mkdir Output
cd %own%\Output
mkdir user
mkdir studio
timeout 2 >nul
copy "%own%\%user%\*.*" "%own%\Output\user\*.*"
copy "%own%\%studio%\*.*" "%own%\Output\studio\*.*"
echo %own%\Output\studio
Powershell -Command Compress-Archive -CompressionLevel Optimal -Path "%own%\Output\user" -DestinationPath "%own%\one.zip"
Powershell -Command Compress-Archive -CompressionLevel Optimal -Path "%own%\Output\studio" -DestinationPath "%own%\two.zip"
del /Q /F /S "%own%\Output"
cd %own%
mkdir Outpur
copy "%own%\one.zip" "%own%\Outpur"
copy "%own%\two.zip" "%own%\Outpur"
Powershell -Command Compress-Archive -CompressionLevel Optimal -Path "%own%\Outpur\*.*" -DestinationPath "%own%\Out.zip"
del /Q /S "%own%\Output\"
del /Q /S "%own%\Outpur\"
del /Q /S "%own%\Output"
del /Q /S "%own%\Outpur"
rmdir /Q /S "%own%\Output"
rmdir /Q /S "%own%\Outpur"
del /Q /S "%own%\one.zip"
del /Q /S "%own%\two.zip"
cls
cd %own%
ren "Out.zip" "Output.zip"
cls
echo Completed!
pause >nul | echo Press any key to exit.
exit
