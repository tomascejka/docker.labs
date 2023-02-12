#
# @see https://hub.docker.com/_/microsoft-mssql-server
#
FROM mcr.microsoft.com/mssql/server:2022-latest

# 'SA_PASSWORD=yourStrong(!)Password'
# docker run -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=xSl@vnik123' -e 'MSSQL_PID=Express' -p 1433:1433 -d mcr.microsoft.com/mssql/server:2017-latest-ubuntu
ENV SA_PASSWORD xSl@vnik123
ENV ACCEPT_EULA Y
ENV MSSQL_PID Express

EXPOSE 1433
