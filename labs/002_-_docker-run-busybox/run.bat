@echo off

call _var.bat

REM https://docs.docker.com/engine/reference/run/
docker run %imgName% echo hello man!