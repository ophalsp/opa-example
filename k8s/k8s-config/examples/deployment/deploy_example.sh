#!/bin/sh

cd ~/workspace/opa-example/k8s/k8s-config/examples/deployment/

kubectl create namespace depval

kubectl apply -f configmaps-opa.yml -n opa

