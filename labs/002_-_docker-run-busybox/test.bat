@echo off

echo.
echo ------------------------------------------
echo Zobraz bezici kontejnery:
echo ------------------------------------------
docker ps
pause

echo.
echo ------------------------------------------
echo Zobraz vsechny (i zastavene) kontejnery:
echo ------------------------------------------
docker ps -as