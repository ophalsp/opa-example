#!/bin/sh

cd ~/workspace/opa-example/k8s/k8s-config/examples/ingress/

kubectl delete -f ingress-ok.yml -n production
kubectl delete -f ingress-bad.yml -n qa

kubectl delete -f qa-namespace.yml
kubectl delete -f production-namespace.yml

kubectl delete configmap ingress-whitelist -n opa
