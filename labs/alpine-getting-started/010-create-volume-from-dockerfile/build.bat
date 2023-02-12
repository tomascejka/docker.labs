@echo off

call _var.bat
call docker build -t %imgName% .