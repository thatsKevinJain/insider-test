#!/bin/bash

SOURCE_IMAGE=034976329924.dkr.ecr.ap-south-1.amazonaws.com/nodejs-test:latest

echo ======================== Building $SOURCE_IMAGE ========================

docker build -t "$SOURCE_IMAGE" .

echo ======================== Tag $SOURCE_IMAGE as "latest" ========================

docker tag "$SOURCE_IMAGE" nodejs-test:latest

echo ======================== Logging in - ECR ========================

aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 034976329924.dkr.ecr.ap-south-1.amazonaws.com

echo ======================== Pushing $SOURCE_IMAGE to ECR ========================

docker push "$SOURCE_IMAGE"

echo ================ DONE ================