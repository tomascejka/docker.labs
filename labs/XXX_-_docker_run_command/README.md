# docker run command
Zde si vyzkousime spustit docker kontejner.

## Build
Spuštěním ```build.bat``` se provede ```docker build``` příkaz, který sestaví ```docker image```.

## Run
Spuštěním ```run.bat``` se provede ```docker run``` příkaz, který vytvoří instanci kontejneru z ```docker image``` a spustí jej. Můžete se rozhodnout, zda jej spustíte ```inline``` (uvidíte v konsoli, co kontejner dělá) nebo ```detached``` (na pozadí).

## Test
Spuštěním ```test.bat``` se spustí ```docker logs``` příkaz, který vypíše do konsole posledních pár řádek, co kontejner dělá.

## Sources
+ https://docs.docker.com/get-started/overview/#docker-objects