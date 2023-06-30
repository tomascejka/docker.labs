@echo off

quarkus create && cd code-with-quarkus

quarkus create app org.acme:kubernetes-quickstart --extension='resteasy-reactive,kubernetes,jib'