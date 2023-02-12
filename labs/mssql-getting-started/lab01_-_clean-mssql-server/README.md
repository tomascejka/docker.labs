# lab01_-_clean-mssql-server
Cílem je umět spustit [mssql server](https://docs.microsoft.com/en-us/sql/linux/quickstart-install-connect-docker?view=sql-server-ver16&pivots=cs1-cmd) jako [docker container](https://docs.docker.com/get-started/overview/#containers). 

## Přehled
Buď si můžeš zvolit cestu, že si to naspouštíš sám bez pomoci skritpů ve složce ```/bin``` pak jdi do kapitoly **Minimalistický případ** anebo s pomocí skriptů jdi do kapitoly **Komplexní případ**. Pro ověření výstupu - zda laboratoř funguje, najdete v kapitole **Ověření serveru**.


## Předpoklady
Je nutné mít nainstalovaný [docker-engine](https://docs.docker.com/engine/install/), tzn. mít na počítači [docker-cli](https://docs.docker.com/engine/reference/commandline/cli/), abych mohl [sestavovat](https://docs.docker.com/engine/reference/commandline/build/) docker [image](https://docs.docker.com/get-started/overview/#images) a [spouštět](https://docs.docker.com/engine/reference/commandline/run/) docker [kontejner](https://docs.docker.com/get-started/overview/#containers) s mssql serverem.

Takovýto dockerfile:

```
#
# @see https://hub.docker.com/_/microsoft-mssql-server
#
FROM mcr.microsoft.com/mssql/server:2022-latest

ENV SA_PASSWORD xSl@vnik123
ENV ACCEPT_EULA Y
ENV MSSQL_PID Express

EXPOSE 1433
```

## Poznámky

### 1. Minimalistický případ
Buď sestavíš docker image pomocí ```docker run``` anebo pomocí Dockerfile a příkazu ```docker build```.

```
docker run -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=xSl@vnik123' -e 'MSSQL_PID=Express' ^
 -p 1433:1433 -d mcr.microsoft.com/mssql/server:2017-latest-ubuntu
```
nebo ...

```
docker build -f ..\Dockerfile -t mssql-gs-1/mssql-started:latest ..
``` 

### 2. Komplexní případ

#### Sestavení

Stačí se přesunout do složky ```cd build``` a spustit příkaz:

```
.\build.bat
``` 

#### Spuštění

Stačí se přesunout do složky ```cd build``` a spustit příkaz:

```
.\run.bat
```

### 3. Ověření serveru

Najdi běžící docker kontejner via ```docker ps``` a najdi jeho ```<container_id|container_name>``` a pak spusť tento příkaz

```
docker exec -it <container_id|container_name> /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P xSl@vnik123 -Q "select @@version"
```

A na výstup to vypíše komplexní version informaci o serveru:

```
--------------------------------------------------------------------------------------------------------------------------------------------------------
Microsoft SQL Server 2022 (CTP2.0) - 16.0.600.9 (X64)
        May 20 2022 13:29:42
        Copyright (C) 2022 Microsoft Corporation
        Express Edition (64-bit) on Linux (Ubuntu 20.04.4 LTS) <X64>

(1 rows affected)
```



## Závěr
Dokerizace MSSQL serveru není tak složitá (tak jako před 4 lety). Dokonce i oficiální stránky mi stačily k dotažení této laboratoře k funkčnímu výsledku - běžící server v docker kontejneru. Nicméně nutno poznamenat, že docker image má bezmála 2GB (neuvěřitelné).

## Zdroje
* https://hub.docker.com/_/microsoft-mssql-server >> kapitola How to use this Image, obsahuje příkazy ke spuštění pro Minimalistický případ
* https://hub.docker.com/_/microsoft-mssql-tools >> prikaz select @@version
* https://docs.microsoft.com/en-us/sql/tools/sqlcmd-utility?view=sql-server-ver16 >> parametry pro query v ramci console prikazu, viz ```-q``` nebo  ```-Q```
