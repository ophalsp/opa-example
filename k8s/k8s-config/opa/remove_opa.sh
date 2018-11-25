#!/bin/sh

cd ~/workspace/opa-example/k8s/k8s-config/opa

rm -f .secrets/*.*

kubectl delete -f opa.yml -n opa

kubectl delete -f webhook.yml

kubectl delete secret opa-server -n opa

kubectl delete ns opa

kubectl delete clusterrolebinding peter-ophals-cluster-admin-binding