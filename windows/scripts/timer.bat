@echo off
setlocal enabledelayedexpansion

rem Set the duration of the timer in seconds
set "duration=60"

echo Timer starts with a duration of %duration% seconds.

rem Calculate the current time
set /a "minutes=!duration! / 60"
set /a "seconds=!duration! %% 60"

echo Timer: !minutes! minutes !seconds! seconds

:countdown
if "!duration!" leq "0" goto :end

set /a "duration-=1"
set /a "minutes=!duration! / 60"
set /a "seconds=!duration! %% 60"

echo Timer: !minutes! minutes !seconds! seconds
timeout /t 1 /nobreak >nul
goto :countdown

:end
echo Timer has ended!
pause
