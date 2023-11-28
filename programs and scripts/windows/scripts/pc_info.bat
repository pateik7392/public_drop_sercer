@echo off
echo version 1.1
echo Computer Information (Windows)
echo ----------------------------
systeminfo | findstr /B /C:"Host Name" /C:"OS Name" /C:"OS Version" /C:"System Manufacturer" /C:"System Model" /C:"Total Physical Memory" /C:"BIOS Version"
echo ----------------------------
pause
