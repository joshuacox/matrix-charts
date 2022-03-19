#1/bin/sh
#Deploys the ConfigMap
kubectl apply -f postgres-configMap.yaml
#Deploys the PersistentVolume
kubectl apply -f postgres-pvc.yaml
#Deploys the StatefulSet
kubectl apply -f postgres-statefulSet.yaml
#Deploys the Service
kubectl apply -f postgres-svc.yaml
