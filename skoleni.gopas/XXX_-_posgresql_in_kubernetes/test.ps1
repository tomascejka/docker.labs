$podName=kubectl get pods --no-headers -o custom-columns=":metadata.name"

#echo $podName

kubectl exec -it $podName --  psql -h localhost -U admin --password -p 5432 postgresdb