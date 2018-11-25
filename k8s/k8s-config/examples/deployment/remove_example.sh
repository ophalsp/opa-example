#!/bin/sh

cd ~/workspace/opa-example/k8s/k8s-config/examples/deployment/

kubectl delete -f configmaps-opa.yml -n opa

kubectl delete namespace depval