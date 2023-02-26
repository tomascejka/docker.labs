@echo off

call _var.bat

REM https://docs.docker.com/engine/reference/commandline/logs/
docker logs --tail 5 %appName%