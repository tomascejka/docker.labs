# docker push command

Tady chci rozebrat push command, co moc nechapu je pouziti, viz. nize

- docker tag
- docker commit
... je potreba tyto prikazy nastudovat


```
Pushing a Docker container image to Docker Hub🔗
To push an image to Docker Hub, you must first name your local image using your Docker Hub username and the repository name that you created through Docker Hub on the web.

You can add multiple images to a repository by adding a specific :<tag> to them (for example docs/base:testing). If it’s not specified, the tag defaults to latest.

Name your local images using one of these methods:

When you build them, using docker build -t <hub-user>/<repo-name>[:<tag>]
By re-tagging an existing local image docker tag <existing-image> <hub-user>/<repo-name>[:<tag>]
By using docker commit <existing-container> <hub-user>/<repo-name>[:<tag>] to commit changes
Now you can push this repository to the registry designated by its name or tag.


 docker push <hub-user>/<repo-name>:<tag>
The image is then uploaded and available for use by your teammates and/or the community.
```
zdroj - https://docs.docker.com/docker-hub/repos/#pushing-a-docker-container-image-to-docker-hub


```
PS D:\Repositories\labs\flyway.labs\70-flyway-kubernetes-gs\docker> .\push.bat
-----------------------------------
flyway-info
tomascejka/flyway-info
-----------------------------------
Authenticating with existing credentials...
WARNING! Your password will be stored unencrypted in C:\Users\tomas.cejka.STYRAX\.docker\config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store

Login Succeeded

Uploadovat mssql server image?, eg. y:y

---------------------------------------------
Uploadne MSSQL image do docker.hub-u
---------------------------------------------
The push refers to repository [docker.io/tomascejka/flyway-mssql-init-db]
85ab489ac15a: Pushed
fc6ce9a52d99: Pushed
8ecaacd1b054: Pushed
9647b30c7493: Pushing [==========================>                        ]  95.35MB/178.5MB
af375a418205: Pushing [=========>                                         ]  237.5MB/1.218GB
0002c93bdb37: Pushing [==================================================>]  75.16MB
```

```
PS D:\Repositories\labs\flyway.labs\70-flyway-kubernetes-gs\docker> .\push.bat
Authenticating with existing credentials...
WARNING! Your password will be stored unencrypted in C:\Users\tomas.cejka.STYRAX\.docker\config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store

Login Succeeded

The push refers to repository [docker.io/tomascejka/flyway-mssql-init-db]
85ab489ac15a: Pushed
fc6ce9a52d99: Pushed
8ecaacd1b054: Pushed
9647b30c7493: Pushed
af375a418205: Pushed
0002c93bdb37: Pushed
latest: digest: sha256:8adea8dce2bbf1d3c9503788534d748c916ca0c61d422906013b1ac051b28c4b size: 1782
PS D:\Repositories\labs\flyway.labs\70-flyway-kubernetes-gs\docker>
```
zdroj - https://hub.docker.com/repository/docker/tomascejka/flyway-mssql-init-db/general