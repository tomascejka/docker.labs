@echo off
REM
REM Vytvori inicializacni stav tve zkoumaci laborator
REM Zavisi na slozce __template, ktera musi byt na stejne urovni
REM
REM @author tomas.cejka
REM

SET WORKDIR=%cd%

:GRAPHICS
ECHO ================================================
ECHO .
ECHO   Fantastic, 
ECHO       you wanna learn new thing!!!
ECHO .
ECHO   Good job, man!
ECHO .
ECHO ================================================
REM Pojmenuj svoji novou laborator, a vytvori se jeji slozka
SET /P name=Give a name for your fantastic idea: 

mkdir %WORKDIR%\%name%

REM zkopiruje soubory i sub-adresarich, 
REM viz. https://stackoverflow.com/questions/7170683/copy-all-files-and-folders-from-one-drive-to-another-drive-using-dos-command-pr
xcopy %WORKDIR%\___template %WORKDIR%\%name% /h /i /c /k /e /r /y

:OUTPUT
ECHO ================================================
ECHO Your testing enviroment SUCCESSFULL created!
ECHO       name: %name%
ECHO       time: %date% - %time%
ECHO ================================================

cd %WORKDIR%\%name%
