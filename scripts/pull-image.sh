#!/bin/bash

# This script will pull an image from AWS ECR #

echo --- Congifuring AWS Credentials ---
aws configure set aws_access_key_id AKIAI4WRGV3AR6KAJIIA
aws configure set aws_secret_access_key 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

echo --- Get Access Token ---
aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 034976329924.dkr.ecr.ap-south-1.amazonaws.com

echo --- Pull NodeJS Image ---
docker pull 034976329924.dkr.ecr.ap-south-1.amazonaws.com/nodejs-test:latest

echo --- Done ---