# 010 - alpine create volume in dockerfile
Vytvori to mount point behem build-u, kdyz dam run.bat a zvolim ne-deamon spusteni, tzn. ze vidim logovani containeru do console, tak apline kontainer skonci v konsoli a ceka. Diky tomu jsem schopen overit, napr. via docker desktop, zda mount-point vznikl.

## Build
Spust ```build.bat``` a spusti se build docker image definovane via Dockerfile, viz. nize
```
FROM alpine
RUN mkdir /myvol
RUN echo "hello world" > /myvol/greeting
VOLUME /myvol
````

## Run
Spust ```run.bat``` a vyber volbu ```n```, ze nechces spustit kontejner na pozadi, viz. nize:

```
$ run.bat
-----------------------------------
alpine-create-volume-in-dockerfile
tocecz/alpine-create-volume-in-dockerfile
-----------------------------------
Do you run as deamon? y/n:

```

## Test
Kontejner bezi v popředí a nabídne nám shell a to přesně potřebujeme pro test, protože lze dohledat mount-point dané volume, kt. jsem vytvořili v dockerfile souboru. Ale aplikovat několik způsobu ověřní, viz. níže:

1. lze dohledat, kdyz jsem uvnitr beziciho kontejneru (v shell-u) a dejte ```ls``` prikaz a uvidite slozku ```myvol```.
2. spuste docker desktop a otevrete si ```Volumes``` a uvidite vpravo, ze pri spusteni kontejneru mount-point skutecne vznikne (nazev je sha hash)
3. nebo si spuste jinou konsoli dejte ```docker volume ls``` a uvidite ji ve vypisu v konsoli.

## Sources
1. https://docs.docker.com/engine/reference/builder/#volume
2. https://docs.docker.com/engine/reference/commandline/volume_ls/