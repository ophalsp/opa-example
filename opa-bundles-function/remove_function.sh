#!/bin/sh

functionName=$1

cd ~/workspace/opa-example/opa-bundles-function/

gcloud functions delete $functionName --region europe-west1