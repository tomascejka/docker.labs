# docker hello world
První setkání s [docker clientem](https://styraxconsulting.atlassian.net/wiki/spaces/Akademie/pages/1103102183/Docker+client+-+docker+cli) a spuštěním ```hello-world``` [kontejneru](https://styraxconsulting.atlassian.net/wiki/spaces/Akademie/pages/1088290824/Docker+-+kontejner). Kontejner provede výpis na stdout a poté ukončí se - a již neběží (vysvětlím později)!

## Build
Spuštěním ```build.bat``` dojde (ke [stažení](https://styraxconsulting.atlassian.net/wiki/spaces/Akademie/pages/1102938288/Docker+-+jak+st+hnout+image) ```hello-world```  image z [registru](https://styraxconsulting.atlassian.net/wiki/spaces/Akademie/pages/1089601562/Docker+-+image+registry)):

```
latest: Pulling from library/hello-world
2db29710123e: Pull complete
Digest: sha256:ffb13da98453e0f04d33a6eee5bb8e46ee50d08ebe17735fc0779d0349e889e9
Status: Downloaded newer image for hello-world:latest
docker.io/library/hello-world:latest
```

## Run
Skriptem ```run.bat``` dojde ke spuštění/sestavení kontejneru a vypíše na výstup:

```
Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/
```

## Test
Kontejner a jeho běh si prohlédneme via ```test.bat```; nebo ```docker ps```, resp. ```docker ps -as``` (zobrazí se i zastavené kontejnery).

```
------------------------------------------
Zobraz bezici kontejnery:
------------------------------------------
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
Press any key to continue . . .

------------------------------------------
Zobraz vsechny (i zastavene) kontejnery:
------------------------------------------
CONTAINER ID   IMAGE                COMMAND    CREATED         STATUS                     PORTS     NAMES             SIZE
ee0eb471c67f   hello-world:latest   "/hello"   2 minutes ago   Exited (0) 2 minutes ago             dazzling_kepler   0B (virtual 13.3kB)
524e4d386a4b   hello-world          "/hello"   4 minutes ago   Exited (0) 4 minutes ago             frosty_curran     0B (virtual 13.3kB)
```

### Závěr
Příkazem ```docker pull <image-name>``` (viz. ```run.bat```) se daná image stáhne ze vzdáleného repositáře. Poté pomocí ```docker run <image-name>``` se vytvoří instanci image/tzv. kontejner a spustí, vykoná úlohu a poté se zastaví (=ukončí se). 