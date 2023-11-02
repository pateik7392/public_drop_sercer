@echo off
setlocal enabledelayedexpansion

rem Set the dimensions of the game field
set "width=20"
set "height=10"

rem Initialize the game variables
set "snake=5-5"
set "food=10-5"
set "direction=right"

:gameLoop
cls

rem Draw the game field
for /l %%y in (1,1,%height%) do (
    for /l %%x in (1,1,%width%) do (
        set "cell=%%x-%%y"
        if "!snake:~0,3!"=="!cell!" (
            set "cell=X"
        ) else (
            if "!food!"=="!cell!" (
                set "cell=O"
            ) else (
                set "cell= "
            )
        )
        echo -n !cell!
    )
    echo.
)

rem Move the snake

rem Detect collision with food

rem Detect collision with wall

timeout /t 0.1 /nobreak >nul
goto gameLoop
