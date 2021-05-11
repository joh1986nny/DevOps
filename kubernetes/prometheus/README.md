# PROMETHEUS

## Instalar Prometheus
> kubectl apply -f bundle.yaml 

## Comprobar instalación
> kubectl get deploy
```
NAME                  READY   UP-TO-DATE   AVAILABLE   AGE
deployment-nodeport   3/3     3            3           3d
grafana               1/1     1            1           2d22h
prometheus-operator   1/1     1            1           33s <------ deploy creado
```
## configurar los permisos de Prometheus RBAC
> kubectl apply -f prom_rbac.yaml 

## Implementar Prometheus
>  kubectl apply -f prometheus.yaml
```
johnny@johnny-inetum:~/DevOps/kubernetes/prometheus$ kubectl apply -f prometheus.yaml
prometheus.monitoring.coreos.com/prometheus created
```
## Ver versión instalada
> kubectl get prometheus

## Crear servicio Prometheus
> kubectl apply -f prom_svc.yaml
```
johnny@johnny-inetum:~/DevOps/kubernetes/prometheus$ kubectl apply -f prom_svc.yaml
service/prometheus created
johnny@johnny-inetum:~/DevOps/kubernetes/prometheus$ kubectl get service
NAME                  TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)          AGE
grafana               NodePort    10.105.152.92    <none>        3000:31901/TCP   3d1h
kubernetes            ClusterIP   10.96.0.1        <none>        443/TCP          21d
prometheus            ClusterIP   10.102.120.184   <none>        9090/TCP         61s    < --------
prometheus-operated   ClusterIP   None             <none>        9090/TCP         136m
prometheus-operator   ClusterIP   None             <none>        8080/TCP         145m
servidores-web        NodePort    10.103.52.149    <none>        8080:30650/TCP   3d2h
```
