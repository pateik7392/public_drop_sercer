@echo off
setlocal enabledelayedexpansion

rem Generate a random number between 1 and 100
set /a "secretNum=%random% %% 100 + 1"

echo Welcome to the Guess the Number game!
echo I've picked a number between 1 and 100.
echo Can you guess it?

:guess
set /p "guessNum=Enter your guess: "

if %guessNum% lss %secretNum% (
    echo Your guess is too low. Try again.
    goto guess
) else if %guessNum% gtr %secretNum% (
    echo Your guess is too high. Try again.
    goto guess
) else (
    echo Congratulations! You've guessed the correct number: %secretNum%
)

endlocal
