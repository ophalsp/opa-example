#!/bin/bash
# Shell script to emulate/deploy all Cloud Functions in the file

${FUNCTIONS_CMD} deploy helloGET --region $GCF_REGION --trigger-http

${FUNCTIONS_CMD} deploy opaBundleServer --region $GCF_REGION --trigger-http