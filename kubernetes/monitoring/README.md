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

## Configuración de métricas de estado de Kube
> git clone https://github.com/devopscube/kube-state-metrics-configs.git
```
johnny@johnny-inetum:~/DevOps/kubernetes/monitoring$ git clone https://github.com/devopscube/kube-state-metrics-configs.git
Clonando en 'kube-state-metrics-configs'...
remote: Enumerating objects: 10, done.
remote: Counting objects: 100% (10/10), done.
remote: Compressing objects: 100% (9/9), done.
remote: Total 10 (delta 0), reused 7 (delta 0), pack-reused 0
Desempaquetando objetos: 100% (10/10), 2.33 KiB | 398.00 KiB/s, listo.
```
> kubectl apply -f kube-state-metrics-configs/
```
johnny@johnny-inetum:~/DevOps/kubernetes/monitoring$ kubectl apply -f kube-state-metrics-configs/
clusterrolebinding.rbac.authorization.k8s.io/kube-state-metrics created
clusterrole.rbac.authorization.k8s.io/kube-state-metrics created
deployment.apps/kube-state-metrics created
serviceaccount/kube-state-metrics created
service/kube-state-metrics created
```
> kubectl get deployments kube-state-metrics -n kube-system
```
johnny@johnny-inetum:~/DevOps/kubernetes/monitoring$ kubectl get deployments kube-state-metrics -n kube-system
NAME                 READY   UP-TO-DATE   AVAILABLE   AGE
kube-state-metrics   1/1     1            1           2m44s
```


## Exponer prometheus como un servicio - Nodeport -- prometheus_service.yaml
> kubectl create -f prometheus-service.yaml --namespace=monitoring
```
johnny@johnny-inetum:~/DevOps/kubernetes/monitoring$ kubectl create -f prometheus-service.yaml --namespace=monitoring
service/prometheus-service created
```

## Comprobar acceso a prometheus -- 192.168.49.2:30000
![Prometheus access](https://github.com/joh1986nny/DevOps/blob/master/images/prometheus_access.png)

## Comprobar Targets
![Prometheus Objetives](https://github.com/joh1986nny/DevOps/blob/master/images/prometheus_objetives.png)