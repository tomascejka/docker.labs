@echo off

kubectl config use-context docker-desktop

kubectl delete -f postgres-config.yaml
REM kubectl delete -f postgres-pvc-pv.yaml
kubectl delete -f postgres-deployment.yaml
kubectl delete -f postgres-service.yaml