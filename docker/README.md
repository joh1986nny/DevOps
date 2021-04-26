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

## ver historial de contenedores
docker ps -a | head

## Crear imagen y taggearla
docker commit <id contenedor>
###### tag sin version - latest
docker image tag <id imagen> <nombre imagen>
###### tag con versionado 
docker image tag <id imagen> <nombre imagen>:<version>
###### ejecución del contenedor
docker run mifiglet figlet hola

# 3.Dockerfile

## Crear Dockerfile
vim figlet/Dockerfile
## Construir contenedor
docker build figlet/
## Taggeado + version 
docker image tag <id imagen> autofiglet:1.0
## Correr nuevo contenedor 
docker run autofiglet:1.0 figlet "Hola Mundo"
## Historial de la imagen
docker image  history  <id imagen>