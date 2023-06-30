@echo off

kubectl config use-context docker-desktop

kubectl delete -f .\target\kubernetes\kubernetes.yml