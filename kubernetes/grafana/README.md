# GRAFANA

## Crear cluster grafana
> kubectl create deployment grafana --image=docker.io/grafana/grafana:5.4.3

## Exponer el servicio grafana 
> kubectl expose deployment grafana --type=LoadBalancer --port=80 --target-port=3000 --protocol=TCP

## Loggin en grafana: 192.168.49.2:31051
![Loggin grafana](https://github.com/joh1986nny/DevOps/blob/master/images/grafana_loggin.png)

## Instalar complemento grafana kubernetes
> kubectl exec -it grafana-79b7c549b4-gptz2 grafana-cli plugins install grafana-kubernetes-app

## Escalar implementación
> kubectl scale deployment grafana --replicas=0

> kubectl scale deployment grafana --replicas=1 

# GRAFANA PERSISTENTE

## Crear ficheros deployment, volumen persistencia y servicio balanceador 
Deployment: [Fichero Deployment](https://github.com/joh1986nny/DevOps/tree/master/kubernetes/grafana/grafana-deployment.yaml).

Volumen Persistente: [Fichero Volumen Persistente](https://github.com/joh1986nny/DevOps/tree/master/kubernetes/grafana/grafana-pvc.yaml).

Servicio Balanceador: [Fichero Servicio Balanceador](https://github.com/joh1986nny/DevOps/tree/master/kubernetes/grafana/grafana-service.yaml).


## Crear deployment, persistencia y servicio
> kubectl create -f grafana-deployment.yaml -f grafana-pvc.yaml -f grafana-service.yaml
```
deployment.apps/grafana created
persistentvolumeclaim/grafana-storage created
service/grafana created
---
NAME           TYPE           CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
grafana        LoadBalancer   10.100.76.239   <pending>     3000:31416/TCP   19s
kubernetes     ClusterIP      10.96.0.1       <none>        443/TCP          16d
my-service     ClusterIP      10.103.42.158   <none>        8080/TCP         17h
my-service-1   NodePort       10.99.19.40     <none>        8080:31965/TCP   16h
```

## Comprobar el estado
> kubectl get svc
```
NAME           TYPE           CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
grafana        LoadBalancer   10.100.76.239   <pending>     3000:31416/TCP   19s
kubernetes     ClusterIP      10.96.0.1       <none>        443/TCP          16d
my-service     ClusterIP      10.103.42.158   <none>        8080/TCP         17h
my-service-1   NodePort       10.99.19.40     <none>        8080:31965/TCP   16h
```

## Loggin en grafana: 192.168.49.2:31416
![Loggin grafana](https://github.com/joh1986nny/DevOps/blob/master/images/grafana_persistente.png)