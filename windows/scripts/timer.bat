@echo off
setlocal enabledelayedexpansion

rem Nastavte délku časovače v sekundách
set "duration=60"

echo Časovač začíná s délkou %duration% sekund.

rem Vypočítat aktuální čas
set /a "minuty=!duration! / 60"
set /a "sekundy=!duration! %% 60"

echo Časovač: !minuty! minut !sekundy! sekund

:countdown
if "!duration!" leq "0" goto :end

set /a "duration-=1"
set /a "minuty=!duration! / 60"
set /a "sekundy=!duration! %% 60"

echo Časovač: !minuty! minut !sekundy! sekund
timeout /t 1 /nobreak >nul
goto :countdown

:end
echo Časovač skončil!
pause
