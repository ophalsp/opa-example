#!/bin/sh

cd ~/workspace/opa-example/k8s/k8s-config/examples/deployment/

echo "kubectl create namespace depval"
kubectl create namespace depval

echo ""
echo ""
echo ""

echo "kubectl apply -f deployment-bad.yml -n depval"
kubectl apply -f deployment-bad.yml -n depval

echo ""
echo ""
echo ""

echo "kubectl apply -f deployment-bad-image-prefix.yml -n depval"
kubectl apply -f deployment-bad-image-prefix.yml -n depval

echo ""
echo ""
echo ""

echo "kubectl apply -f deployment-bad-labels.yml -n depval"
kubectl apply -f deployment-bad-labels.yml -n depval

echo ""
echo ""
echo ""

echo "kubectl apply -f deployment-ok.yml -n depval"
kubectl apply -f deployment-ok.yml -n depval

