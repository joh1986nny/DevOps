# Comando utilizados en docker

# Ver contenedores activos
docker ps

# Correr repositorio hello-word
docker run hello-word

# Descargar repositorio
docker pull alpine

# Descarga repositorio con version expecifica
docker run alpine:3.7

# Correr comando dentro de contenedor
docker run alpine:3.7 ls -l

# Correr contenedor interactivo 
docker run -it alpine:3.7 sh

# Correr comando en contenedor activo
docker exec -it c5ac9528b576 cat /etc/motd