@echo off


rem Initialize the game board
set "board=123456789"
set "player=X"

:gameLoop
cls
echo version 1.1
timeout /T 2 > mul
echo Tic-Tac-Toe
echo.
echo %board:1=1% | %board:2=2% | %board:3=3%
echo -+-+--
echo %board:4=4% | %board:5=5% | %board:6=6%
echo -+-+--
echo %board:7=7% | %board:8=8% | %board:9=9%
echo.


goto gameLoop
