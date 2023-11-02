@echo off
setlocal enabledelayedexpansion

rem Náhodně vygenerujeme číslo od 1 do 100, které si počítač myslí
set /a "comp_number=!random! %% 100 + 1"
set /a "attempts=5"

echo Welcome to the Guess the Number game!
echo You have a total of %attempts% attempts.

:gameLoop
set /p "guess=Enter your guessed value: "

if "!guess!" gtr "!comp_number!" (
    echo Your number is too high.
) else if "!guess!" lss "!comp_number!" (
    echo Your number is too low.
) else (
    echo Congratulations, you guessed the number !comp_number!.
    goto :end
)

set /a "attempts-=1"
if "!attempts!" leq "0" (
    echo Unfortunately, you have no attempts left.
    echo The computer thought of the number !comp_number!.
    goto :end
)

echo You have !attempts! attempts left.
goto gameLoop

:end
pause
