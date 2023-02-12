# 010 - alpine mount volume
Vytvoří to mount-point (viz. Sources[1]) do složky na host-ovi, kterou musíme nejdříve vytvořit a povolit v Docker Desktop.

## Build
Zde build fázi neřeším, pracuji přímo OS alpine a jeho image - mrkněte do ```run.bat``` anebo níže na popis.

## Run
Spust ```run.bat``` a vyber volbu ```n```, ze nechces spustit kontejner na pozadi, viz. nize. Příkaz ```docker run``` má navíc parameter ```-v```, kterým definujeme lokální složku (kam se má kontejner napojit, bacha na cesty ve Windows, viz. (viz. Sources[2]) ) a remote složku (kt. lze použít pro zápis/read přímo v kontejneru).

Příkaz v naivní formě je takto (v ```run.bat``` je if/else zda chci spustit kontejner v popředí/či nikoli). tzn. složku /my_files najdu v běžícím kontejneru a je připojen a hosta do c:/volume-data (je nutné tuto složku přidat do docker desktop, jinak to bude hlásit problém s právami na danou složku)

```
docker run -it -v /c/volume-data:/my_files apline sh
```


```
$ run.bat
-----------------------------------
alpine-bind-volume
alpine
-----------------------------------
Do you run as deamon? y/n:

```

## Test
Kontejner bezi v popředí a nabídne nám shell a to přesně potřebujeme pro test, protože lze dohledat mount-point dané volume, kt. jsem vytvořili v ```run``` fázi. Spust prikaz ```ls my_files``` pro vypis obsahu namoutovane slozky:

```
/ # ls my_files/
wildfly_logging
/ #
```
Jak vidíte v tuto chvíli během testu, tam mám složku z jiné laboratoře, kde jem testoval logovani wildlfy server-u v docker kontejneru.

## Sources
1. https://www.docker.com/blog/file-sharing-with-docker-desktop/
2. https://forums.docker.com/t/docker-compose-creating-volume-from-windows-to-linux/90483/5 << jak definovat cesty ve Windows, např. ```c:\my_data``` je nutné přepsat do ```/c/my_data```