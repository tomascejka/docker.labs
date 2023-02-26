@echo off

REM -- nazev registru na docker.hub.com
SET regName=tomascejka
REM -- nazev image
SET appName=toce-docker-cmd-run
REM -- nazev tagu/verse -- vyber si jak na to budes nahlizet
SET tagVersion=latest
REM -- nazev image, pod kterym bude ulozena v registru /local a pak i remote/
SET imgName=%regName%/%appName%:%tagVersion%

REM https://docs.docker.com/engine/reference/commandline/build/
REM docker build -f Dockerfile -t %imgName% .

REM https://docs.docker.com/engine/reference/run/
REM docker run --rm --name toce-%appName% %imgName%

echo -------------------------------------------------------------------------
echo image:    %imgName%
echo container:%appName%
echo -------------------------------------------------------------------------