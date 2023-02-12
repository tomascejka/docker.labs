@echo off

call _var.bat

REM   docker run -it -v /users/stephen:/my_files ubuntu bash
SET volumeHostDir=/c/docker-volumes
SET volumeCommand=-v %volumeHostDir%:/my_files

SET /P opt="Do you run as deamon? y/n: "
IF [%opt%] EQU [n] (
	REM zavola ze console je zaroven pohledem do logu
	call docker run -it --rm --name %appName% %volumeCommand% %imgName% sh
) ELSE (
	REM zavola ze se spusti deamon na pozadi a vypise se containerId	
	call docker run -d --rm --name %appName% %volumeCommand% %imgName% sh
)