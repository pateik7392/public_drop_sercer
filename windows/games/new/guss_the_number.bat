@echo off
setlocal enabledelayedexpansion

rem Náhodně vygenerujeme číslo od 1 do 100, které si počítač myslí
set /a "comp_number=!random! %% 100 + 1"
set /a "attempts=5"

echo Vítejte v hře Uhodněte číslo od 1 do 100!
echo Máte celkem %attempts% pokusů.

:gameLoop
set /p "guess=Zadejte vaši tipovanou hodnotu: "

if "!guess!" gtr "!comp_number!" (
    echo Vaše číslo je příliš vysoké.
) else if "!guess!" lss "!comp_number!" (
    echo Vaše číslo je příliš nízké.
) else (
    echo Gratulujeme, uhodli jste číslo !comp_number!.
    goto :end
)

set /a "attempts-=1"
if "!attempts!" leq "0" (
    echo Bohužel, nemáte žádné pokusy zbývající.
    echo Počítač si myslel číslo !comp_number!.
    goto :end
)

echo Zbývá vám !attempts! pokusů.
goto gameLoop

:end
pause
