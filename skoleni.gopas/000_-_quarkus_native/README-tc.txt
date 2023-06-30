## VirtualBox
Ucili jsem se buildovat nativni pristup s quarkus-em. Delali jsem to ve VirtualBox image. Tento projekt by mel byt naslednikem a mel bych se pokusit to prenest na local
protoze mi tady bude urcite chybet GraalVM.

## Kubernetes
Ve VirtualBoxu jsem vybuildoval image, kt. jsem pak prenesl na hosta, viz. image.tar, kt. jsem via docker load prikaz nahral do docker cache na host-ovi. Diky tomu jsem byl schopen ji pouzivat localne (v docker desktop) a pouzit ji v kubernetes (v docker desktop).

## Postup/Poznamky
Zde jsou poznamky, jake prikazy jsem delal ve VirtualBox image:
	- nativni aplikace
		- /opt/graalvm/bin/gu list
		- /opt/graalvm/bin/gu install native-image

		- mvn clean package -Pnative -DskipTests (kdyz mas nainstalovany graalVM, pouzival jsem ve virtualboxu, kde graalvm byl nainstalovanej)
		- mvn package -Dquarkus.container-image.build=true -Pnative -DskipTests << quarkus pouziva pro native pristup extra kontainer (a v nem spusti/pouzije graalvm)
		- /target
		- nezapomen, ze Service musi byt typu NodePort a musi mit nodePort  
			type: NodePort << TOTO
			spec:
			  ports:
			    - name: http
			      port: 80
			      protocol: TCP
			      targetPort: 8080
			      nodePort: 32400 << TOTO	

## Cil
Az se k tomuto projektu opet dostanu, je nutne se naucit s GraalVM na locale, tzn. pracovat s nim a vytvorit si nativni image (```gu install native-image```). A pote umet zbuildovat aplikaci (```mvn clean package -Pnative -DskipTests```) a pote umet ji zbuildovat pro k8s (```mvn package -Dquarkus.container-image.build=true -Pnative -DskipTests```), po tomto prikazu jsou pak v ```target/kubernetes``` soubory pro pouziti v k8s.