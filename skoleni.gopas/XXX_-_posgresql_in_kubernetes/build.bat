@echo off

kubectl config use-context docker-desktop

kubectl apply -f postgres-config.yaml
kubectl apply -f postgres-pvc-pv.yaml
kubectl apply -f postgres-deployment.yaml
kubectl apply -f postgres-service.yaml