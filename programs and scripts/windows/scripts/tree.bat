@echo off
setlocal enabledelayedexpansion

for /L %%i in (1,1,15) do (
    cls
    for /L %%j in (1,1,%%i) do (
        set "spaces="
        for /L %%k in (1,1,20) do (
            set "spaces=!spaces! "
        )
        echo !spaces!^|
    )
    echo ==========^|
    timeout /t 1 /nobreak >nul
)

cls
echo tree is done!
pause
