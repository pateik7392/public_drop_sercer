@echo off
setlocal enabledelayedexpansion

:calcLoop
cls
echo Simple Batch Calculator
echo.
echo Choose an operation:
echo 1. Addition
echo 2. Subtraction
echo 3. Multiplication
echo 4. Division
echo 5. Quit

set /p "choice=Enter the operation number: "

if "%choice%"=="1" (
    set /p "num1=Enter the first number: "
    set /p "num2=Enter the second number: "
    set /a "result=num1+num2"
    echo Result: %result%
    pause
) else if "%choice%"=="2" (
    set /p "num1=Enter the first number: "
    set /p "num2=Enter the second number: "
    set /a "result=num1-num2"
    echo Result: %result%
    pause
) else if "%choice%"=="3" (
    set /p "num1=Enter the first number: "
    set /p "num2=Enter the second number: "
    set /a "result=num1*num2"
    echo Result: %result%
    pause
) else if "%choice%"=="4" (
    set /p "num1=Enter the first number: "
    set /p "num2=Enter the second number: "
    set /a "result=num1/num2"
    echo Result: %result%
    pause
) else if "%choice%"=="5" (
    exit
) else (
    echo Invalid choice. Please select an operation number from 1 to 5.
    pause
)

goto calcLoop
