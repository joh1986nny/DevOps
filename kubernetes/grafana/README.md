# GRAFANA

## Crear cluster grafana
> kubectl create deployment grafana --image=docker.io/grafana/grafana:5.4.3

## Exponer el servicio grafana 
> kubectl expose deployment grafana --type=LoadBalancer --port=80 --target-port=3000 --protocol=TCP

## Loggin en grafana: 192.168.49.2:31051
![Loggin grafana](https://github.com/joh1986nny/DevOps/blob/master/images/grafana_loggin.png)

## Instalar complemento grafana kubernetes
> kubectl exec -it grafana-79b7c549b4-gptz2 grafana-cli plugins install grafana-kubernetes-app

## Escalamr implementación
> kubectl scale deployment grafana --replicas=0

> kubectl scale deployment grafana --replicas=1 
