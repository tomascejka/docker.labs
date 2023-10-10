# docker run, sysout and stop
Opět spustíme [docker run](https://docs.docker.com/engine/reference/run/) kontejner a vypíšeme výstupy do konsole (ale již reálná data o kontejneru, např. hostname).

## Build
Spuštěním ```build.bat``` dojde (ke [stažení](https://styraxconsulting.atlassian.net/wiki/spaces/Akademie/pages/1102938288/Docker+-+jak+st+hnout+image) ```alpine```  image z [registru](https://styraxconsulting.atlassian.net/wiki/spaces/Akademie/pages/1089601562/Docker+-+image+registry) a poté) k sestavení docker kontejneru:

```
latest: Pulling from library/alpine
f56be85fc22e: Already exists
Digest: sha256:124c7d2707904eea7431fffe91522a01e5a861a624ee31d03372cc1d138a3126
Status: Downloaded newer image for alpine:latest
docker.io/library/alpine:latest
```

## Run
Skriptem ```run.bat``` dojde ke spuštění kontejneru a vypíše se příkaz buď obsah ```/etc/host``` nebo ```/etc/hostname``` na výstup:

```
Write out hostname? y/n, eg. y: y

Write out: /etc/hostname:
80cc070c513b
--

Write out hostname? y/n, eg. y: n

Write out: /etc/hosts:
127.0.0.1       localhost
::1     localhost ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
172.17.0.2      5d2ebd576f61
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
