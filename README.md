# Scratch-Hacker
Colllects info about users, studios, and much more!

# Guide
The guid to do evrything correctly!
do NOT run anything as administrator unless a program or the guide tell you to.

## Curl
open cmd.exe and type "curl --help" (without ").
if it gives you a whole list of commands, you can skip this step.
if it gives an error that the command doesn't exist, do the following steps: 
check your powershell version (needs to be 5.5 or higher)
run "install curl.bat" as ADMINISTRATOR and wait until its finished.

## Set a perma bookmark (optional but recommended)
what this does is, it makes 2 files to always fetch the same data on every run unless you change it (by running it again and changing the settings).
just run "permanent maker.bat"
user: 
means the username of the account you want to get data from, large accounts may lag and impact internet speed.
studio:
means the id of the studio, it can be found in the url of the studio.
it is mostly always 6 digits/numbers.
now just wait for like 25 miliseconds (thats really short btw, 0.025 seconds i think).
perma bookmark set!

## Run the program!
just run "reader.bat".
this uses curl, so check the first step if u didn't already.
if you have set a perma ("perma bookmark" for short), the program will run automatically.
if you didn't, you have to input the same things as in the perma maker (check step 2).
if it gives any errors, please download curl yourself, i might not have done it correctly.
tip: check "log.log" to see all the progress!

## Combine!
run "combine.bat"
this will only work if you have set a perma.
this will combine every file of the current perma.

## Compress
run "compress.bat"
uses powershell.
requires a perma.
this will compress all the files to two zip files (one for user and the other for studio) and then compress them both too.
