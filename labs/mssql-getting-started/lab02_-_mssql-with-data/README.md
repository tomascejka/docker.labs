# lab02_-_mssql-with-data
Cílem je umět spustit [mssql server](https://docs.microsoft.com/en-us/sql/linux/quickstart-install-connect-docker?view=sql-server-ver16&pivots=cs1-cmd) jako [docker container](https://docs.docker.com/get-started/overview/#containers) včetně nahráních dat do databáze, tzn. že vznikne databázové schéma včetně tabulek a dat v nich. 
.
## Přehled
Krátký přehled o dané laboratoři o jejím cíli ...
.
## Předpoklady
Popiš, co je nutné mít dříve, než začneš s touto laboratoří experimentovat ...

Takovýto dockerfile
```
#
# @see https://github.com/microsoft/mssql-docker/blob/master/linux/preview/examples/mssql-customize/Dockerfile
#
FROM mcr.microsoft.com/mssql/server:2017-latest

# Create a config directory
RUN mkdir -p /usr/config
WORKDIR /usr/config

# Bundle config source
COPY . /usr/config

# Grant permissions for to our scripts to be executable
RUN chmod +x /usr/config/entrypoint.sh
RUN chmod +x /usr/config/configure-db.sh

ENTRYPOINT ["./entrypoint.sh"]
```

.
## Poznámky
Zde popiš cestu k cíli, jak danou laboratoř používat ...
.
## Závěr
Zde napiš k čemu si dospěl... ideálně
.
## Zdroje
* https://github.com/microsoft/mssql-docker/tree/master/linux/preview/examples/mssql-customize
* https://www.softwaredeveloper.blog/initialize-mssql-in-docker-container
* https://dotnetthoughts.net/initialize-mssql-in-docker-container/
