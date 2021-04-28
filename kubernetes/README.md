# MINIKUBE

## Comandos básicos

### Inicializar minikube
minikube start
### Parar minikube
minikube stop
### Borrar minikube
minikube delete
### Ver estado minikube
minikube status
### Ver listado de addons
minikube addons list
### Habilitar addons
minikube addons enable metrics-server
### Ver estado de pods
kubectl -n kube-system get pods
### Acceso a la maquina minikube
minukube ssh
### Ver IP de minikube
minikube ip

# KUBERNETES

## Comandos basicos

### PODS
#### Listar pods
> kubectl get pods
#### Crear pod -- nginx
> kubectl run servidorweb --image=nginx:alpine
#### Ver Logs de un pod
> kubectl describe pod servidorweb 
#### Ver recursos api
> kubectl api-resorces
#### Eliminar pod
> kubectl delete pod servidorweb-failed
