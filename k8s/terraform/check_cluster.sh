#!/bin/sh

cd ~/workspace/opa-example/k8s/terraform/

echo "---------- export GOOGLE_APPLICATION_CREDENTIALS ----------"
export GOOGLE_APPLICATION_CREDENTIALS=~/workspace/opa-example/k8s/terraform/credentials.json

echo "---------- terraform plan ----------"
terraform plan
