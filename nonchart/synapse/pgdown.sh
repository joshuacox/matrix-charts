#!/bin/sh
kubectl delete -f postgres-svc.yaml
kubectl delete -f postgres-statefulSet.yaml
kubectl delete -f postgres-configMap.yaml
kubectl delete -f postgres-pvc.yaml
