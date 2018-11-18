#!/bin/sh

functionName=$1

cd ~/workspace/opa-example/opa-bundles-function/

gcloud functions deploy $functionName --runtime nodejs6 --region europe-west1 --trigger-http