# MINIKUBE

## Comandos básicos

###### Inicializar minikube
minikube start
###### Parar minikube
minikube stop
###### Borrar minikube
minikube delete
###### Ver listado de addons
minikube addons list
###### Habilitar addons
minikube addons enable metrics-server
###### Ver estado de pods
kubectl -n kube-system get pods
###### Acceso a la maquina minikube
minukube ssh
###### Ver IP de minikube
minikube ip