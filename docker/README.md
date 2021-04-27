# 1. Comandos básicos 

## Ver contenedores activos
docker ps

## Correr repositorio hello-word
docker run hello-word

## Descargar repositorio
docker pull alpine

## Descarga repositorio con version expecifica
docker run alpine:3.7

## Correr comando dentro de contenedor
docker run alpine:3.7 ls -l

## Correr contenedor interactivo 
docker run -it alpine:3.7 sh

## Correr comando en contenedor activo
docker exec -it id_contenedor cat /etc/motd

## Ver logs contenedor
docker logs id_contenedor

# 2.Imágenes - Versiones de contenedores

## Crear Ubuntu, actualizarlo e instalar figlet
docker run -it ubuntu /bin/bash
apt-get update
apt-get install figlet
apt-get install figlet

## Ver historial de contenedores
docker ps -a | head

## Crear imagen y taggearla
docker commit id_contenedor
###### Tag sin version - latest
docker image tag id_imagen nombre_imagen
###### Tag con versionado 
docker image tag id_imagen nombre_imagen>:version
###### Ejecución del contenedor
docker run mifiglet figlet hola

# 3.Dockerfile

## Crear figlet Dockerfile
vim figlet/Dockerfile
## Construir contenedor
docker build figlet/
## Taggeado + version 
docker image tag id_imagen autofiglet:1.0
## Correr nuevo contenedor 
docker run autofiglet:1.0 figlet "Hola Mundo"
## Historial de la imagen
docker image  history  id_imagen

## Añadir contenido a figlet + versionado
docker build figlet/ -t autofiglet:1.1
## Comprobar nueva version
docker run autofiglet:1.1 ls /tmp/
docker run autofiglet:1.1 cat /tmp/hola

# 4.Volumenes y puertos

## Descargar imagen nginx
docker pull nginx
## Correr en background nginx
docker run -d nginx
## Instalar comando ps && ver procesos ejecutandose
apt-get update && apt-get install -y procps
ps fax
## Comprobar web
curl localhost
## Parar contenedor nginx
docker stop id_contenedor

## Correr contenedor con web propia 
docker run -v ~/DevOps/docker/nginx/index.html:/usr/share/nginx/html/index.html:ro -d nginx
## Comprobar que se ha montado correctamente
docker exec -it id_contenedor bash
cat /usr/share/nginx/html/index.html 
curl localhost

## Exponer web en local 
docker run -v ~/DevOps/docker/nginx/index.html:/usr/share/nginx/html/index.html:ro -p 8080:80 -d nginx
## Comprobar web
curl localhost:8080

# 5.Docker Compose

## Lanzar docker-compose. MySQL + Wordpress
docker compose up -d

# 6. Multi Stage Builds
###### Crea un go y descarga un archivo desde un servidor externo.

## Construir Contenedor
docker build -t alexellis/href-counter:latest .
## Ejecutar contenedor 
docker run -it alexellis/href-counter sh
## Comprobar peso de la imagen
ls -lh

# 7.Subir imagen a Dockerhub

## Loguearse en Dockerhub
docker login 
## Tag imagen a subir con nombre delante
docker tag 9736646b209a arch3r86/autofiglet:1.1
## Subir imagen
docker push arch3r86/autofiglet:1.1

# 8.Crear network

## Crear red
docker network create servidor-app

## Crear contenedor en la red
docker run -d \
> --network servidor-app --network-alias mysql
> --network servidor-app --network-alias mysql \
> -v servidor-mysql-data:/var/lib/mysql \
> -e MYSQL_ROOT_PASSWORD=secret \
> -e MYSQL_DATABASE=servidores \
> mysql:5.7

## Comprobar instalación
docker exec -it id_contenedor mysql -p
mysql> show databases;

## Instalar contenedor netshoot y ver IP contenedor mysql
docker run -it --network servidor-app nicolaka/netshoot
dig mysql

```
; <<>> DiG 9.16.11 <<>> mysql
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 3530
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 0

;; QUESTION SECTION:
;mysql.                         IN      A

;; ANSWER SECTION:
mysql.                  600     IN      A       172.19.0.2

;; Query time: 0 msec
;; SERVER: 127.0.0.11#53(127.0.0.11)
;; WHEN: Tue Apr 27 11:56:28 UTC 2021
;; MSG SIZE  rcvd: 44
```
