@echo off

call _var.bat

REM https://docs.docker.com/engine/reference/run/
docker run --rm --name %appName% %imgName%