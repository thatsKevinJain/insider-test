#!/bin/bash

# This script will login to AWS and create a shared secret in kubernetes cluster #

echo --- Congifuring AWS Credentials ---
aws configure set aws_access_key_id AKIAI4WRGV3AR6KAJIIA
aws configure set aws_secret_access_key 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

echo --- Get Access Token ---
TOKEN=$(aws ecr get-login-password --region ap-south-1)

echo --- Create New Secret in Kubernetes Cluster ---
kubectl create secret docker-registry regcred \
--docker-server=034976329924.dkr.ecr.ap-south-1.amazonaws.com \
--docker-username=AWS --docker-password=${TOKEN} \
--docker-email=thatskevinjain@gmail.com

echo --- Done ---