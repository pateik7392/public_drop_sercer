@echo off
setlocal enabledelayedexpansion

rem Nastavení rozměrů hracího pole
set "width=20"
set "height=10"

rem Inicializace hada
set "snake=5-5"

:gameLoop
cls

rem Vykreslení hracího pole
for /l %%y in (1,1,%height%) do (
    for /l %%x in (1,1,%width%) do (
        set "cell=%%x-%%y"
        if "!snake:~0,3!"=="!cell!" (
            set "cell=X"
        ) else (
            set "cell= "
        )
        if "!food!"=="!cell!" (
            set "cell=O"
        )
        echo -n !cell!
    )
    echo.
)

rem Pohyb hada

rem Detekce kolize s jídlem

rem Detekce kolize se zdí

timeout /t 1 /nobreak >nul
goto gameLoop
