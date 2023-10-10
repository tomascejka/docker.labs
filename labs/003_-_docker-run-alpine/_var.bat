@echo off

REM -- nazev registru na docker.hub.com
SET regName=index.docker.io
REM -- nazev image
SET appName=alpine
REM -- nazev tagu/verse -- vyber si jak na to budes nahlizet
SET tagVersion=latest
REM -- nazev image, pod kterym bude ulozena v registru /local a pak i remote/
SET imgName=%regName%/%appName%:%tagVersion%

echo -------------------------------------------------------------------------
echo image:    %imgName%
echo container:%appName%
echo -------------------------------------------------------------------------