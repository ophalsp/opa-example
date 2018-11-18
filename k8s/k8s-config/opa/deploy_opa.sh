#!/bin/sh

kubectl create ns opa

cd ~/workspace/opa-example/k8s/k8s-config/opa

mkdir .secrets

openssl genrsa -out .secrets/ca.key 2048
openssl req -x509 -new -nodes -key .secrets/ca.key -days 100000 -out .secrets/ca.crt -subj "/CN=admission_ca"

openssl genrsa -out .secrets/server.key 2048
openssl req -new -key .secrets/server.key -out .secrets/server.csr -subj "/CN=opa.opa.svc" -config server.conf
openssl x509 -req -in .secrets/server.csr -CA .secrets/ca.crt -CAkey .secrets/ca.key -CAcreateserial -CAserial .secrets/ca.srl -out .secrets/server.crt -days 100000 -extensions v3_req -extfile server.conf

kubectl create secret tls opa-server --cert=.secrets/server.crt --key=.secrets/server.key -n opa

kubectl create clusterrolebinding peter-ophals-cluster-admin-binding --clusterrole=cluster-admin --user=peter.ophals@gmail.com

kubectl apply -f opa.yml -n opa

echo "export the ca.crt and base64 encode once more using: 'cat ~/workspace/opa-example/k8s/k8s-config/opa/.secrets/ca.crt | base64'"
echo ""
echo "copy the result in the webhook.yml file near caBundle"
echo ""
echo "apply the webhook file using: 'kubectl apply -f ~/workspace/opa-example/k8s/k8s-config/opa/webhook.yml -n opa'"

