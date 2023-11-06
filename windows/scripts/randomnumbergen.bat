@echo off
setlocal enabledelayedexpansion

rem Set the range of random numbers (1-100)
set /a "min=1"
set /a "max=100"

rem Generate a random number within the specified range
set /a "randomNum=!random! %% (%max% - %min% + 1) + %min%"

echo Random number between %min% and %max% is: %randomNum%

endlocal
