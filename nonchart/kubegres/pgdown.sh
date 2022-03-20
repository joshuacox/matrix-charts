#!/bin/sh
#kubectl delete -f https://raw.githubusercontent.com/reactive-tech/kubegres/v1.15/kubegres.yaml
kubectl delete -f postgres-secret.yaml
kubectl delete -f postgres.yaml
#kubectl delete -f postgres-pvc.yaml
#kubectl delete -f postgres-statefulSet.yaml
#kubectl delete -f postgres-svc.yaml
