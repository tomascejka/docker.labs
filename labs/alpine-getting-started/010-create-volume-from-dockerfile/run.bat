@echo off

call _var.bat

SET /P opt="Do you run as deamon? y/n: "
IF [%opt%] EQU [n] (
	REM zavola ze console je zaroven pohledem do logu
	call docker run -it --rm --name %appName% %imgName%
) ELSE (
	REM zavola ze se spusti deamon na pozadi a vypise se containerId	
	call docker run -d --rm --name %appName% %imgName%	
)