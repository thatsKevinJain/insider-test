#!/bin/bash

# This script will build a docker image and push it to AWS ECR #

SOURCE_IMAGE=034976329924.dkr.ecr.ap-south-1.amazonaws.com/nodejs-test:latest

echo --- Building $SOURCE_IMAGE ---

docker build -t "$SOURCE_IMAGE" .

echo --- Tag $SOURCE_IMAGE as "latest" ---

docker tag "$SOURCE_IMAGE" nodejs-test:latest

echo --- Congifuring AWS Credentials ---
aws configure set aws_access_key_id AKIAI4WRGV3AR6KAJIIA
aws configure set aws_secret_access_key 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

echo --- Logging in - ECR ---

aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 034976329924.dkr.ecr.ap-south-1.amazonaws.com

echo --- Pushing $SOURCE_IMAGE to ECR ---

docker push "$SOURCE_IMAGE"

echo --- DONE ---