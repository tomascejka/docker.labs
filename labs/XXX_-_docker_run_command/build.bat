@echo off

call _var.bat
docker build -f Dockerfile -t %imgName% .