# Migrace image location v docker desktop

## Postup
```
Let me quote all required steps here too:

Quit Docker Desktop

Open Command Prompt (or PowerShell)

List existing WSL storages

$ wsl --list -v
Expected output:

  NAME                   STATE           VERSION
* docker-desktop         Running         2
  docker-desktop-data    Running         2
Turn off WSL

$ wsl  --shutdown
Output:

  NAME                   STATE           VERSION
* docker-desktop         Stopped         2
  docker-desktop-data    Stopped         2
Create following path (with all subfolders):

$ mkdir D:\Docker\wsl\data\
Export containers and their data. This step can actually take some time depending on the size of the original ext4.vhdx file.

$ wsl --export docker-desktop-data "D:\Docker\wsl\data\docker-desktop-data.tar"
Unregister the container data from WSL. It will also automatically delete the ext4.vhdx from original location.

$ wsl --unregister docker-desktop-data
Import the container data, but keep it into another location (i.e. on drive D: as defined above). This will automatically create ext4.vhdx file from the backup.

$ wsl --import docker-desktop-data "D:\Docker\wsl\data" "D:\Docker\wsl\data\docker-desktop-data.tar" --version 2
Delete the exported .tar file: D:\Docker\wsl\data\docker-desktop-data.tar and nothing more!

Start Docker Desktop and run your containers.
```

## Zdroje
+ https://blog.codetitans.pl/post/howto-docker-over-wsl2-location/