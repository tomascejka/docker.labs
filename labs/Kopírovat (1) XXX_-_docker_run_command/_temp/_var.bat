@echo off

REM -- nazev registru na docker.hub.com
SET regName=tomascejka
REM -- nazev image
SET appName=java-random
REM -- nazev tagu/verse -- vyber si jak na to budes nahlizet
SET tagVersion=v1
REM -- nazev image, pod kterym bude ulozena v registru /local a pak i remote/
SET imgName=%regName%/%imgName%:%tagVersion%

# docker build -f Dockerfile -t %imgName% .
# docker run --rm --name toce-%appName% %imgName%

echo -----------------------------------
echo %appName%
echo %imgName%
echo -----------------------------------