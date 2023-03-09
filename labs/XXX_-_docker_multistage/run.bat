@echo off

call _var.bat

docker run --rm --name %appName% %imgName%