# Školení - předpříprava

Zde shromažďovat nápady a připomínky, z kterých vzejde školení pro Docker.

OBECNE
	- Introducion to containers
		- tipy pro pojmenovani, https://www.digitalocean.com/community/tutorials/3-tips-for-naming-docker-containers
	- napad:
		- docker ps command
			- docker-alpine:latest, CMD ["echo" "Hello world"]
				+ via 'docker ps' neni videt
				+ az v 'docker ps -a'.
			- docker-alpine:latest, CMD ["ping", "google.com"]
				+ lze je videt via 'docker ps'

ALPINE
	- zdroje
		+ https://octopus.com/blog/using-alpine-docker-image
	- napady

NGINX
	- zdroje
		+ https://hub.docker.com/_/nginx
		+ https://mpolinowski.github.io/docs/DevOps/NGINX/2020-08-26--nginx-docker-setup/2020-08-26/
	- napady
		+ napad-001: od jednoducheho run, run-with-volume(index.html), build+copy(index.html) za pouziti NGINX
			``` #jednoduchy run
			docker run -p 8080:80 nginx:stable-alpine
			curl http://localhost:8080/index.html
			```
			
			``` #run-with-volume(index.html), vytvor soubor index.html
			cat > index.html << EOF
			<html>
		    	<body>
		        	Hello from Octopus!
		    	</body>
			</html>
			EOF
			
			docker run -v $(pwd):/usr/share/nginx/html:ro -p 8080:80 nginx:stable-alpine
			curl http://localhost:8080/index.html
			```
			
			``` # build+copy(index.html), vytvor Dockerfile
			FROM nginx:stable-alpine
			COPY index.html /usr/share/nginx/html/index.html
			
			docker build . -t mynginx
			docker run -p 8080:80 mynginx
			curl http://localhost:8080/index.html
			```
			zdroj - https://octopus.com/blog/using-nginx-docker-image
		--
		+ napad-002: jak konfigurovat nginx server v docker runtime
			Je nutne pochopit nginx (default, ```/etc/nginx/nginx.conf```) konfiguraci; a diky instrukci ```include /etc/nginx/conf.d/*.conf;``` lze pridat custom konfiguraci.
			
			``` # default conf umisteny: /etc/nginx/nginx.conf
			user  nginx;
			worker_processes  auto;
			
			error_log  /var/log/nginx/error.log notice;
			pid        /var/run/nginx.pid;
			
			
			events {
		    	worker_connections  1024;
			}
			
			
			http {
		    	include       /etc/nginx/mime.types;
		    	default_type  application/octet-stream;
			
		    	log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
		                      	'$status $body_bytes_sent "$http_referer" '
		                      	'"$http_user_agent" "$http_x_forwarded_for"';
			
		    	access_log  /var/log/nginx/access.log  main;
			
		    	sendfile        on;
		    	#tcp_nopush     on;
			
		    	keepalive_timeout  65;
			
		    	#gzip  on;
			
		    	include /etc/nginx/conf.d/*.conf;
			}
			```
			
			``` # dalsi default konfigurace pro http server, viz. /etc/nginx/conf.d
			server {
		    	listen       80;
		    	server_name  localhost;
			
		    	#access_log  /var/log/nginx/host.access.log  main;
			
		    	location / {
		        	root   /usr/share/nginx/html;
		        	index  index.html index.htm;
		    	}
			
		    	#error_page  404              /404.html;
			
		    	# redirect server error pages to the static page /50x.html
		    	#
		    	error_page   500 502 503 504  /50x.html;
		    	location = /50x.html {
		        	root   /usr/share/nginx/html;
		    	}
			
		    	# proxy the PHP scripts to Apache listening on 127.0.0.1:80
		    	#
		    	#location ~ \.php$ {
		    	#    proxy_pass   http://127.0.0.1;
		    	#}
			
		    	# pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000
		    	#
		    	#location ~ \.php$ {
		    	#    root           html;
		    	#    fastcgi_pass   127.0.0.1:9000;
		    	#    fastcgi_index  index.php;
		    	#    fastcgi_param  SCRIPT_FILENAME  /scripts$fastcgi_script_name;
		    	#    include        fastcgi_params;
		    	#}
			
		    	# deny access to .htaccess files, if Apache's document root
		    	# concurs with nginx's one
		    	#
		    	#location ~ /\.ht {
		    	#    deny  all;
		    	#}
			}
			```
			
			Vytvorime tedy svou custom konfiugraci (```health-check.conf```) a zapracujeme ji do Dockerfile pote ji spustime (a pridame mapovani na 9090/90 tcp porty).
			``` # health-check.conf
			server {
		    	listen       90;
		    	server_name  localhost;
			
		    	location /nginx-health {
		        	return 200 "healthy\n";
		        	add_header Content-Type text/plain;
		    	}
			}
			
			# pridame health-check.conf do /etc/nginx/conf.d/
			FROM nginx:stable-alpine
			COPY index.html /usr/share/nginx/html/index.html
			COPY health-check.conf /etc/nginx/conf.d/health-check.conf
			
			# pridam nove porty 9090:90
			docker build . -t mynginx
			docker run -p 8080:80 -p 9090:90 mynginx
			
			# krome stare url pribyla i nova na port-u 9090
			curl http://localhost:8080/index.html
			curl http://localhost:9090/nginx-health
			```
			zdroj - https://octopus.com/blog/using-nginx-docker-image#advanced-nginx-configuration

        --