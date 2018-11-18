#!/bin/sh

cd ~/workspace/opa-example/k8s/k8s-config/examples/ingress/

kubectl create configmap ingress-whitelist --from-file=ingress-whitelist.rego -n opa

kubectl create -f qa-namespace.yml
kubectl create -f production-namespace.yml

kubectl create -f ingress-ok.yml -n production
kubectl create -f ingress-bad.yml -n qa