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
docker exec -it <id contenedor> cat /etc/motd

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

