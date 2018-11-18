#!/bin/sh

cd ~/workspace/opa-example/k8s/terraform/

echo "---------- export GOOGLE_APPLICATION_CREDENTIALS ----------"
export GOOGLE_APPLICATION_CREDENTIALS=~/workspace/opa-example/k8s/terraform/credentials.json

echo "---------- terraform apply -auto-approve ----------"
terraform apply -auto-approve

echo "---------- gcloud container clusters get-credentials opa-gke-cluster --zone europe-west1-b --project opaexample ----------"
gcloud container clusters get-credentials opa-gke-cluster --zone europe-west1-b --project opaexample
