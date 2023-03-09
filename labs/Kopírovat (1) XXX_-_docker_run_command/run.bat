@echo off

call _var.bat

:choose_option
echo.
echo Run container as:
echo     [1] inline
echo     [2] detached
echo.
set /p opt="Choose an option, eg 1: "
goto case_%opt%

REM - proc to nefunguje, http://blog.nullspace.io/batch.html
IF %ERRORLEVEL% NEQ 0 (
	Echo An error was found
	goto eof
)

:case_1
	docker run --rm --name %appName% %imgName%
	goto eof
:case_2
	docker run -d --rm --name %appName% %imgName%

:eof