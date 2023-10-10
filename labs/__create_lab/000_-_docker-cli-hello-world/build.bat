@echo off

call _var.bat

REM https://docs.docker.com/engine/reference/commandline/build/
REM docker build -f Dockerfile -t %imgName% .

REM https://docs.docker.com/engine/reference/commandline/pull/
docker pull %imgName%