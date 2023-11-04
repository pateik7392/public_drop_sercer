@echo off
setlocal enabledelayedexpansion

:menu
cls
echo Text Editor
echo 1. Create or Edit a File
echo 2. Quit
set /p "choice=Enter your choice: "

if "%choice%" equ "1" (
    set /p "filename=Enter the filename: "
    notepad "%filename%"
) else if "%choice%" equ "2" (
    echo Goodbye!
    exit /b
) else (
    echo Invalid choice. Please try again.
    timeout /t 2 >nul
    goto menu
)

:end
