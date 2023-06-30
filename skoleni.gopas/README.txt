Praha, 2023-04-20
Miroslav Sevelda, Oracle Certified Lector, miroslav.sevelda@gopas.cz
--

credentials:
	root/linux
		sudo -i
	student/linux
	- putty:
		192.168.56.101
--

Course agenda
	Module 1: Introduction to Docker
	Module 2: Building Docker Images
	Module 3: Dockerizing Java application
	Module 4: Dockerizing Spring application
	MOdule 5: Native appliation
	Module 6: Dockerizin WAR/EAR application
	MOdule 7: Introduction to K8s
	Module 8: Container in production
--

Osnova kurzu, zdroj - gopas stranka
	Docker & Java app
	- Správné Docker image s Javou
	- Nastavení --memory a související podpora v Javě
	- Multi-stage builds

	Dockerizování Spring Boot aplikace
	- Pomocí JIB pluginu
	- Pomocí Paketo buildpack
	- Pomocí Fabric8 Maven pluginu
	- Layered image
	- Distroless image
	- Nastavení proměnných

	Spring Native / Quarkus
	- Native aplikace
	- Build Native aplikace do Docker kontejneru

	Dockerizování WAR aplikace
	- Docker & Tomcat

	Nastavení pro produkci
	- Spring Boot Actuator & healthcheck / liveness & readiness probe
	- Spring Cloud Kubernetes
--


Module 1:
	* container vs. virtual machines
	- (STUDY)jak si napsat container bez docker (via kernel api (linux/windows-hyper-v))?
	- CR - container runtime
		- containerd, crun,  (TODO) prozkoumej
		- sources:
			- https://www.docker.com/blog/what-is-containerd-runtime/
			- https://github.com/containers/crun
			- https://www.redhat.com/sysadmin/introduction-crun
			- https://kubernetes.io/docs/setup/production-environment/container-runtimes/
			- https://kubesphere.io/blogs/part-1-explaining-container-runtimes/
	- NT - container networking
		- https://www.docker.com/blog/how-docker-desktop-networking-works-under-the-hood/
	- Stav
		- volumes
		- sources:
			- https://docs.docker.com/storage/volumes/
			- https://earthly.dev/blog/docker-volumes/
			- https://www.baeldung.com/ops/docker-volumes
	- Docker Hub:
		- bitnami image - (TODO) prozkoumej
	- container standartization:
		- CFNF, cncf.io
			- standarty:
				- CRI - image
					- https://kubernetes.io/docs/concepts/architecture/cri/
					- Open Container Initiative (OCI): a set of standards for containers, describing the image format, runtime, and distribution.
						- https://opencontainers.org/
					- Container Runtime Interface (CRI) in Kubernetes: An API that allows you to use different container runtimes in Kubernetes.					
				- CNI - networking
				- CSI - storage
			- sources:
				- https://www.tutorialworks.com/difference-docker-containerd-runc-crio-oci/
				- https://www.tutorialworks.com/difference-docker-containerd-runc-crio-oci/?utm_medium=sidebar
				- https://www.padok.fr/en/blog/container-docker-oci
				- https://iximiuz.com/en/posts/oci-containers/
		- (STUDY) Buildpack.io, https://buildpacks.io/
	* distroless (study)
		- linux runtime?
		- co to je?
	* shell
		- #!/bin/bash
	* unio filesystem (co to je?)
		- image layering
			L0(RW) upperdir
			L1(RO) lowerdir
			L2(RO) lowerdir
	* networking issue
		- issue: Error response from daemon: Get https://registry-1.docker.io/v2/: dial tcp: lookup registry-1.docker.io on 192.168.65.1:53: no such host
		- https://stackoverflow.com/questions/47580528/error-response-from-daemon-get-https-registry-1-docker-io-v2-dial-tcp-look
		- fix:
			sudo nano /etc/resolv.conf	
			nameserver 8.8.8.8
			sudo systemctl daemon-reload
			sudo systemctl restart docker		
			docker pull nginx
	* networking:
		- https://www.docker.com/blog/how-docker-desktop-networking-works-under-the-hood/
		- ICC, A <----> B
		- site v docker
			- (bridge)dns funguje pouze u vlastni site typu bridge (docker driver)
			- service mesh (istio, linkerd)
				- na docker lze implementovat dve docker container
					- related via other container
						- docker create network --driver bridge myNetwork
						- docker run --name webserver --net myNetwork nginx
						- docker run -it --net container:webservice busybox
		- docker run -p 80 (parameter -p, --publish)
		- iptables -nL -t nat, hledej DNAT
	* docker name=db01, z mariadb
		- https://hub.docker.com/_/mariadb
		- upadne na chybejici heslo resenim je env promenna
--

Module 7: kubernetes
	- kubectl run web01 --image nginx
		- impertive method (not recommended)
	- kubernetes private
		- je nutne resit network plugin
			- cilium
			- calio (doporucene)
	- kubectl api-resources
	- kubectl get pods -w
	- kubectl rollout history deploy <deployment-name>
	- kubectl rollout undo deploy <deployment-name> --to-revision=1
	- HashiCorp Consul
	- kind: Service
		- type: 
			- ClusterIP, 
			- NodePort(dostupny z venku), 
			- LoadBalancer
		- selector:
			tenant: foo (tyto pod budou ve skupine a bude na ne nasmerovan traffic)
	- kubectl apply -f service.yml --dry-run=server
	- kubectl explain service.spec
	- service
		SVC(NP) -> 3xGW -> SVC(CI) -> AS
			- AS via deployment (ale nepodporuje sticky-session)
		SVC(NP) -> 3xGW -> SVC(CI) -> AS
			- (podporuje sticky-session)
		-  pro lokalni testovani
			- https://dbafromthecold.com/2018/02/07/sql-server-in-kubernetes-on-docker-for-windows/
	- statefulSet 
		- pro cluster db, message 
		- vse co je potreba namnozit por ukladani stavu
	- nfs umi kubernetes pro filesystem by default
		- pokud dokazu vytvorit svazek/server, kt. umi NFS a umet je nabizet do site
		- a pokud dokazu ze strany db/statefull setu pripojit k NFS svazku, pak dokoncim instalaci db v kubernetesu
		- cat /etc/exports

	- dockerfile:
	    RUN apt update        --> lze pouzivat ruzne shell variace/moznosti
	    RUN ["apt", "update"] --> exec form

	    
	    USER name[:group] - bud jmeno
	    USER uid[:gid] - nebo id, napr. USER 1024

	    HEALTHCHECK CMD curl -f http://localhost || exit 

	- multistage build
		FROM scratch
	- jib, od google
		- nepotrebuji Dockerfile, 
		- fugnuje pres maven plugin (com.google.cloud.tools:jib-maven-plugin:2.5.0)
			- konfigurovat nexus/private docker registry
		- mvn build jib:build
		- mvn build jib:buildTar
		- docker load -i iamge.tar
	- buildpacks.io
		- no dockerfile, no docker
		- https://buildpacks.io/docs/app-developer-guide/build-an-app/
	- nativni aplikace
		- /opt/graalvm/bin/gu list
		- /opt/graalvm/bin/gu install native-image

		- mvn clean package -Pnative -DskipTests
		- mvn package -Dquarkus.container-image.build=true -Pnative -DskipTests
		- /target

	- probes
		- liveness, restart
		- readnines, vyradi z fronty, nez bude ready a neposila na nej traffic