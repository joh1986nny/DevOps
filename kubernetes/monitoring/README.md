# Monitoring Con Prometheus & Grafana

## Crear un nuevo namespace
> kubectl create namespace monitoring
```
johnny@johnny-inetum:~/DevOps/kubernetes/monitoring$ kubectl create namespace monitoring
namespace/monitoring created
```

## Crear RBAC policy --- clusterRole.yaml
> kubectl create -f clusterRole.yaml
```
johnny@johnny-inetum:~/DevOps/kubernetes/monitoring$ kubectl create -f clusterRole.yaml
clusterrole.rbac.authorization.k8s.io/prometheus created
clusterrolebinding.rbac.authorization.k8s.io/prometheus created
```

## Crear Config-Map
> kubectl create -f config-map.yaml
```
johnny@johnny-inetum:~/DevOps/kubernetes/monitoring$ kubectl create -f config-map.yaml
configmap/prometheus-server-conf created
```

## Desplegar deployment prometheus
> kubectl create  -f prometheus-deployment.yaml 
```
johnny@johnny-inetum:~/DevOps/kubernetes/monitoring$ kubectl create  -f prometheus-deployment.yaml 
deployment.apps/prometheus-deployment created
```
## Comprobar deployment prometheus
> kubectl get deployments --namespace=monitoring
```
johnny@johnny-inetum:~/DevOps/kubernetes/monitoring$ kubectl get deployments --namespace=monitoring
NAME                    READY   UP-TO-DATE   AVAILABLE   AGE
prometheus-deployment   1/1     1            1           64s
```
## Exponer prometheus como un servicio - Nodeport -- prometheus_service.yaml
> kubectl create -f prometheus-service.yaml --namespace=monitoring
```
johnny@johnny-inetum:~/DevOps/kubernetes/monitoring$ kubectl create -f prometheus-service.yaml --namespace=monitoring
service/prometheus-service created
```

## Comprobar acceso a prometheus -- 192.168.49.2:30000
![Prometheus access](https://github.com/joh1986nny/DevOps/blob/master/images/prometheus_access.png)