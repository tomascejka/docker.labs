# Docker getting started

## Komponenty

* Dockerfile – textový soubor s instrukcemi k vytvoření Docker image. Specifikuje operační systém, na kterém bude běžet kontejner, jazyky, lokace, porty a další komponenty.
* Image - předpis, který popisuje, jak má/co obsahuje kontejner (standartizovaný formát). Image má své jméno a tag (versi).
* Kontejner - balíček, který obsahuje běhové prostředí, aplikaci včetně všech závislostí ke svému běhu - vychází (je to instance) z image.
* Registr image - uložiště, kde lze uložit/sdíle image

## Základni architektura

* Docker klient - beží na hostitelském počítači, a komunikuje s Docker daemonem via restové rozhraní - samotný je ovládání via konsolové příkazy
* Docker daemon/server - daemon, který spravuje image/kontejnery, dále komunikuje s uložištěm/registrem image
* Docker hub - uložiště docker image