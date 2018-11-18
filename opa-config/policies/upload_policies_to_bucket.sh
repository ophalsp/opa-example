#!/bin/sh

cd ~/workspace/opa-example/opa-config/policies/

tar -c -zvf bundle.tar.gz http data

gsutil cp bundle.tar.gz gs://opabundles/bundles/users
