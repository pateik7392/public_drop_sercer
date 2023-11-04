@echo off
:clock
cls
for /f "delims=" %%a in ('wmic os get localdatetime ^| find "."') do set datetime=%%a
set "year=%datetime:~0,4%"
set "month=%datetime:~4,2%"
set "day=%datetime:~6,2%"
set "hour=%datetime:~8,2%"
set "minute=%datetime:~10,2%"
set "second=%datetime:~12,2%"
echo Current Time: %hour%:%minute%:%second%
ping -n 2 127.0.0.1 >nul
goto clock
