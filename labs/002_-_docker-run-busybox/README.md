# docker run and stop
Pojďme si představit, jak spustit kontejner pomocí příkazu [docker run](https://docs.docker.com/engine/reference/run/), který vypíše jednoduchý výstup na konsoli.

## Build
Spuštěním ```build.bat``` dojde (ke [stažení](https://styraxconsulting.atlassian.net/wiki/spaces/Akademie/pages/1102938288/Docker+-+jak+st+hnout+image) ```busybox``` image z [registru](https://styraxconsulting.atlassian.net/wiki/spaces/Akademie/pages/1089601562/Docker+-+image+registry)):

```
latest: Pulling from library/busybox
4b35f584bb4f: Pull complete
Digest: sha256:b5d6fe0712636ceb7430189de28819e195e8966372edfc2d9409d79402a0dc16
Status: Downloaded newer image for busybox:latest
docker.io/library/busybox:latest
```

## Run
Skriptem ```run.bat``` dojde ke sestaveni/spuštění kontejneru a vypíše se příkaz ```echo hello man!``` na výstup:

```
hello man!
```

## Test
Spuštěním ```test.bat```; nebo ```docker ps```, resp. ```docker ps -as``` se zobrazí (i zastavené) kontejnery.

```
------------------------------------------
Zobraz bezici kontejnery:
------------------------------------------
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
Press any key to continue . . .

------------------------------------------
Zobraz vsechny (i zastavene) kontejnery:
------------------------------------------
CONTAINER ID   IMAGE            COMMAND             CREATED              STATUS                          PORTS     NAMES             SIZE
a3579f7d3656   busybox:latest   "echo hello man!"   6 seconds ago        Exited (0) 5 seconds ago                  busy_black        0B (virtual 4.86MB)
a0e14d454cde   busybox:latest   "echo hello man!"   29 seconds ago       Exited (0) 28 seconds ago                 charming_wilbur   0B (virtual 4.86MB)
```

## Závěr
Příkazem ```docker run <image-name> <console-command>```, se uvnitř linuxového kontejneru spustí defaultně shell interpret (```/bin/bash -c``` v linuxu, ```cmd /S /C``` ve windows, viz. odkaz 3,4), což dovoluje spoustit shell příkazy. Příkaz má mnohem [širší](https://docs.docker.com/engine/reference/commandline/run/) užití (viz. odkaz 2), ale pro teď se spokojíme s tímto minimalistickým spuštěním.

## Zdroje
1. https://docs.docker.com/engine/reference/run/
2. https://docs.docker.com/engine/reference/commandline/run/
3. https://docs.docker.com/engine/reference/builder/#cmd
4. https://docs.docker.com/engine/reference/builder/#entrypoint
5. https://docs.docker.com/engine/reference/builder/#run