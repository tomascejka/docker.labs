@echo off

call _var.bat

SET /P opt="Write out hostname? y/n, eg. y: "

REM https://docs.docker.com/engine/reference/run/

IF [%opt%] EQU [y] (
	echo.
	echo Write out: /etc/hostname:
	docker run %imgName% cat /etc/hostname
) ELSE (
	echo.
	echo Write out: /etc/hosts:
    docker run %imgName% cat /etc/hosts
)