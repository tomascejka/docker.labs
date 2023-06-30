@echo off

kubectl config use-context docker-desktop

kubectl apply -f .\target\kubernetes\kubernetes.yml