@echo off
setlocal enabledelayedexpansion

rem Nastavení rozměrů hracího pole
set "width=3"
set "height=3"

rem Inicializace hracího pole
for /l %%y in (1,1,%height%) do (
    for /l %%x in (1,1,%width%) do (
        set "cell-%%x-%%y= "
    )
)

:gameLoop
cls

rem Vykreslení hracího pole
for /l %%y in (1,1,%height%) do (
    for /l %%x in (1,1,%width%) do (
        echo -n !cell-%%x-%%y!
    )
    echo.
)

rem Hráč provede tah

rem Detekce výhry nebo remízy

timeout /t 1 /nobreak >nul
goto gameLoop
