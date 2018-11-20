#!/bin/sh

cd ~/workspace/opa-example/k8s/k8s-config/examples/deployment/

kubectl delete configmap deployment-data -n opa
kubectl delete configmap deployment-validation -n opa
kubectl delete configmap system-diagnostics -n opa

kubectl delete namespace depval