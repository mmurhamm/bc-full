#!/bin/bash
source ~/config

echo "deploy auth service for OAuth 2.0 authentication"

oc new-app --name=auth \
 -e HS256_KEY=${HS256_KEY} \
  --image-stream=auth \
  -l app.kubernetes.io/part-of=auth-subsystem

oc expose svc/auth --port=8080 \
  -l app.kubernetes.io/part-of=auth-subsystem