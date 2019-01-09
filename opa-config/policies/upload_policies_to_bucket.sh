#!/bin/sh

cd ~/workspace/opa-example/opa-config/policies/

tar -c -zvf user-bundle.tar.gz http data

gsutil cp user-bundle.tar.gz gs://opabundles/bundles/users/bundle.tar.gz

tar -c -zvf kubernetes-bundle.tar.gz kubernetes data k8s

gsutil cp kubernetes-bundle.tar.gz gs://opabundles/bundles/kubernetes-admission/bundle.tar.gz
