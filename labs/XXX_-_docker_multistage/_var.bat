@echo off

REM -- nazev registru na docker.hub.com
SET regName=tomascejka
REM -- nazev image
SET appName=toce-docker-multistage
REM -- nazev tagu/verse -- vyber si jak na to budes nahlizet
SET tagVersion=latest
REM -- nazev image, pod kterym bude ulozena v registru /local a pak i remote/
SET imgName=%regName%/%appName%:%tagVersion%

REM https://docs.docker.com/engine/reference/commandline/build/
REM docker build -f Dockerfile -t %imgName% .

REM https://docs.docker.com/engine/reference/run/
<<<<<<< HEAD
REM docker run --rm --name %appName% %imgName%
=======
REM docker run --rm --name toce-%appName% %imgName%
>>>>>>> fddc48d0a7d588eda0dccb61184590d4e17d9cda

echo -------------------------------------------------------------------------
echo image:    %imgName%
echo container:%appName%
echo -------------------------------------------------------------------------