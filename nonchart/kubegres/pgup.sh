#!/bin/sh
kubectl apply -f postgres-secret.yaml
kubectl apply -f postgres.yaml
#kubectl apply -f postgres-pvc.yaml
#kubectl apply -f postgres-statefulSet.yaml
#kubectl apply -f postgres-svc.yaml
