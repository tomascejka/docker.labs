# Minimalistic docker image
Minimalistický Dockerfile pro studijní účely - předvede velmi triviální použití. Docker image zde použitá je veřejně dostupná https://hub.docker.com/repository/docker/tomascejka/hello-world.


## Build
Spuštěním ```build.bat``` se spustí ```docker build``` příkaz, který sestaví image dle souboru ```Dockerfile```, jenž vypadá takto:

```
FROM alpine:latest
CMD ["echo", "Hello World"]
```

a uloží ji do lokálního registru po názvem ```tomascejka/hello-world```. Zavoláním ```docker images tomascejka/*``` si lze ověřit:

```
docker images tomascejka/*
REPOSITORY                    TAG       IMAGE ID       CREATED       SIZE
tomascejka/hello-world        latest    d6c9f9e7e093   5 weeks ago   7.05MB
```

## Run
Spuštěním ```run.bat``` se spustí ```docker run``` příkaz, který vytvoří kontejner z výše uvedené image a zavolá příkaz echo definovaný v CMD instrukci, viz. dockerfile výše a výstup zapíše do stdout-u:

```
.\run.bat
Hello World
```

## Sources
+ https://hub.docker.com/repository/docker/tomascejka/hello-world
+ https://docs.docker.com/engine/reference/commandline/build/
+ https://docs.docker.com/engine/reference/commandline/run/
+ https://docs.docker.com/engine/reference/commandline/images/
