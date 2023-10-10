@echo off

call _var.bat

REM https://docs.docker.com/engine/reference/commandline/pull/
docker pull %imgName%