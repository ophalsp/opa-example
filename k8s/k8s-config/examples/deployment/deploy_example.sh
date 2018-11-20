#!/bin/sh

cd ~/workspace/opa-example/k8s/k8s-config/examples/deployment/

kubectl create namespace depval

kubectl create configmap system-diagnostics --from-file=system-diagnostics.rego -n opa
kubectl create configmap deployment-data --from-file=data.rego -n opa
kubectl create configmap deployment-validation --from-file=deployment-validation.rego -n opa

