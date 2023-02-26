@echo off

SET regName=tomascejka
REM -- nazev image
SET imgName=java-random
REM -- nazev tagu/verse -- vyber si jak na to budes nahlizet
SET tagVersion=v1
REM -- nazev image, pod kterym bude ulozena v registru /local a pak i remote/
SET imgCtxName=%regName%/%imgName%:%tagVersion%

docker build -f Dockerfile.%tagVersion% -t %regName%/%imgName%:%tagVersion% .