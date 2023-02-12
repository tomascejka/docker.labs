SET pass=kra
docker run --rm --name postgres -e POSTGRES_PASSWORD=%pass% -d -p 54320:5432 -v "pgdata:/var/lib/postgresql/data" postgres:9.6
