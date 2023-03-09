@echo off

call _var.bat

docker images %regName%/%appName%
docker ps --size -a -f name=%appName%