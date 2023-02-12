SET pass=kra
docker run --rm --name postgres_latest -e POSTGRES_PASSWORD=%pass% -d -p 54321:5432 -v "pgdata:/var/lib/postgresql/data" postgres:latest
