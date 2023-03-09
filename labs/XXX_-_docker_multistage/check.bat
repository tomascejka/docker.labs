@echo off

call _var.bat

docker images %regName%/%appName%
docker ps -f name=%appName%