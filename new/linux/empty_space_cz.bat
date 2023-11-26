@echo off

echo Dostupné místo na disku C:
wmic logicaldisk where "DeviceID='C:'" get FreeSpace
