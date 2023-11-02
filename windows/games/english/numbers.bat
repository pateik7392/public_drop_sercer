@echo off
setlocal enabledelayedexpansion

:: Název souboru pro ukládání naučných dat
set "soubor_naucne_data=education.txt"

:: Výběr režimu hry
set /p "rezim=Vyberte režim hry (1 pro 1-50, 2 pro 1-100, 3 pro 1-500, 4 pro 1-1000): "
if "!rezim!"=="1" (
    set "max_cislo=50"
) else if "!rezim!"=="2" (
    set "max_cislo=100"
) else if "!rezim!"=="3" (
    set "max_cislo=500"
) else if "!rezim!"=="4" (
    set "max_cislo=1000"
) else (
    echo Neplatný režim hry. Použije se výchozí režim 1-100.
    set "max_cislo=100"
)

:: Kontrola existence souboru pro učení
if not exist "!soubor_naucne_data!" (
    echo Soubor s učebními daty neexistuje. Chcete vytvořit nový soubor pro učení? (ANO/NE)
    set /p "vytvorit_soubor="
    if /i "!vytvorit_soubor!"=="ANO" (
        rem Vytvoření nového souboru s výchozími daty
        echo Defaultní data 1 >> "!soubor_naucne_data!"
        echo Defaultní data 2 >> "!soubor_naucne_data!"
        echo Defaultní data 3 >> "!soubor_naucne_data!"
        echo Defaultní data 4 >> "!soubor_naucne_data!"
    ) else (
        echo Vytvoření nového souboru bylo zrušeno. Hra může pokračovat bez učebních dat.
        pause
    )
)

:: Načtení dat z textového souboru pro učení
set "pocet_promennych=0"
for /f "tokens=*" %%a in (!soubor_naucne_data!) do (
    set /a "pocet_promennych+=1"
    set "promenna_!pocet_promennych!=%%a"
)

:: Základní hra
echo Vitajte vo vzdelavacej hre PC vs. hrac.
echo Hra sa hraje od 1 do !max_cislo!. Hrac a PC striedavo zvyšujú číslo od 1 do 10.

set /a "hrač_score=0"
set /a "počítač_score=0"
set "aktuální_tah=hrac"
set "historie_pocitace="

:gameLoop
cls

echo Skore:
echo Hrac: !hrač_score!
echo Pocitac: !počítač_score!

if "!aktuální_tah!"=="hrac" (
    echo Na tahu je hrac.
    set /p "hrač_hodnota=Zadaj cislo od 1 do 10: "
    if "!hrač_hodnota!" geq "1" if "!hrač_hodnota!" leq "10" (
        set /a "hrač_score+=!hrač_hodnota!"
        if "!hrač_score!" gtr "!max_cislo!" (
            set /a "hrač_score=!max_cislo!"
        )
        set "aktuální_tah=počítač"
        set "historie_pocitace=!historie_pocitace!!hrač_hodnota!"
        echo Hráč zvolil číslo !hrač_hodnota! >> "!soubor_naucne_data!"
    )
) else (
    echo Na tahu je pocitac.
    if "!historie_pocitace:~0,1!!historie_pocitace:~1,1!!historie_pocitace:~2,1!!historie_pocitace:~3,1!!historie_pocitace:~4,1!!historie_pocititace:~5,1!!historie_pocitace:~6,1!!historie_pocitace:~7,1!!historie_pocitace:~8,1!!historie_pocitace:~9,1!" equ "12345678910" (
        set /a "počítač_hodnota=10"
    ) else (
        set /a "počítač_hodnota=!random! %% 10 + 1"
    )
    echo Počítač zvolil číslo !počítač_hodnota!
    set /a "počítač_score+=!počítač_hodnota!"
    if "!počítač_score!" gtr "!max_cislo!" (
        set /a "počítač_score=!max_cislo!"
    )
    set "aktuální_tah=hrac"
    set "historie_pocitace=!historie_pocitace!!počítač_hodnota!"
    if "!historie_pocitace:~10!"=="12345678910" (
        set "historie_pocitace="
    )
    echo Počítač zvolil číslo !počítač_hodnota! >> "!soubor_naucne_data!"
)

if "!hrač_score!"=="!max_cislo!" (
    echo Hrac vyhral!
    goto :end
)

if "!počítač_score!"=="!max_cislo!" (
    echo Počítač vyhrál!
    goto :end
)

timeout /t 1 /nobreak >nul
goto gameLoop

:end
echo Koniec hry.

:: Uložení dat do textového souboru pro učení
if exist "!soubor_naucne_data!" (
    del "!soubor_naucne_data!"
)
for /l %%i in (1,1,!pocet_promennych!) do (
    echo !promenna_%%i! >> "!soubor_naucne_data!"
)
pause
