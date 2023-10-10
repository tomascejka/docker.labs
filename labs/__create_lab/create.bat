@echo off


SET /P cname="Zadej nazev laboratore (s podtrzicky namisto mezer): "
MKDIR %cname%
SET WORKDIR=%cname%