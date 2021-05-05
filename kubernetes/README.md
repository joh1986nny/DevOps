# MINIKUBE

## Comandos básicos

### Inicializar minikube
> minikube start
### Parar minikube
> minikube stop
### Borrar minikube
> minikube delete
### Ver estado minikube
> minikube status
### Ver listado de addons
> minikube addons list
### Habilitar addons
> minikube addons enable metrics-server
### Ver estado de pods
> kubectl -n kube-system get pods
### Acceso a la maquina minikube
> minukube ssh
### Ver IP de minikube
> minikube ip

# KUBERNETES

## Comandos basicos

### PODS
#### Listar pods
> kubectl get pods
#### Crear pod -- nginx
> kubectl run servidorweb --image=nginx:alpine
#### Crear pod basado en yaml
> kubectl apply -f autowebserver.yaml
#### Ver Logs de un pod
> kubectl describe pod servidorweb 
#### Ver recursos API
> kubectl api-resorces
#### Ver versiones API
> kubectl api-versions
#### Eliminar pod
> kubectl delete pod servidorweb-failed
#### Ver declaracion de un pod
> kubectl get pod servidorweb -o yaml
#### Port-forwarding 
> kubectl port-forward servidorweb 7000:80
#### Abrir terminal de un pod
> kubectl exec -ti servidorweb -- sh
#### Ver logs de un pod
> kubectl logs servidorweb
#### Cambiar label de un pod
> kubectl label pods servidorweb2 app=pod-label

## Manifiesto con doble contenedor

#### Crear contenedor
> kubectl apply -f doblecontenedor.yaml

#### comprobar funcionamiento
> docker exec -ti id_minikube_container sh

```
# curl 172.17.0.8:8081
cont1
# curl 172.17.0.8:8082
cont2
# 
```

## REPLICASETS

#### Ver el owner de un pod replicado
> kubectl get pod replicaset-prueba-dqmzq -o yaml

```
ownerReferences:
  - apiVersion: apps/v1
    blockOwnerDeletion: true
    controller: true
    kind: ReplicaSet
    name: replicaset-prueba
    uid: 420b7103-62b1-41c6-91a8-9e4f1330ebff
  resourceVersion: "162378"
  uid: a23c8828-a5d4-4084-9f40-0b0218630710  <-----
```

#### Eliminar replicaset
> kubectl delete -f nombre_archivo.yaml
#### Obtener replicasets
> kubectl get rs

## DEPLOYMENTS

#### Construir deployment 
> kubectl apply -f deploy.yaml
#### Ver deployments
> kubectl get deployment
#### Ver deployments y labels
> kubectl get deployment --show-labels
#### Ver si se ha creado el deployment
> kubectl rollout status deployment deployment-prueba
#### Revision de versiones
> kubectl rollout history deployment deployment-prueba

#### CHANGE-CAUSE
> kubectl apply -f deployments/deploy.yaml  --record

> kubectl rollout history deployment deployment-prueba

```
deployment.apps/deployment-prueba 
REVISION  CHANGE-CAUSE
1         kubectl apply --filename=deployments/deploy.yaml --record=true
```
#### ROLLBACK
> kubectl rollour undo deployment deployment-prueba --to-revision=2

## SERVICIOS 

#### Ver servicios 
> kubectl get svc
#### Ver servicios por etiqueta
> kubectl get svc -l app=front
#### Describir servicio 
> kubectl describe svc my-service
```
Name:              my-service
Namespace:         default
Labels:            app=front
Annotations:       <none>
Selector:          app=front
Type:              ClusterIP
IP Families:       <none>
IP:                10.103.42.158
IPs:               10.103.42.158
Port:              <unset>  8080/TCP
TargetPort:        80/TCP
Endpoints:         172.17.0.4:80,172.17.0.5:80,172.17.0.6:80 <--- punto de entrada a pods
Session Affinity:  None
Events:            <none>
```

#### Ver endpoints
> kubectl get endpoints
```
NAME         ENDPOINTS                                   AGE
kubernetes   192.168.49.2:8443                           16d
my-service   172.17.0.4:80,172.17.0.5:80,172.17.0.6:80   10m
```
> kubectl get pods -o wide
```
NAME                                 READY   STATUS    RESTARTS   AGE   IP           NODE       NOMINATED NODE   READINESS GATES
deployment-prueba-67784d784f-gqhrt   1/1     Running   0          11m   172.17.0.4   minikube   <none>           <none>
deployment-prueba-67784d784f-hbwgn   1/1     Running   0          11m   172.17.0.6   minikube   <none>           <none>
deployment-prueba-67784d784f-nm8kp   1/1     Running   0          11m   172.17.0.5   minikube   <none>           <none>
```
