#!/bin/bash

export ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)

aws ecr get-login-password --region ap-northeast-2 | docker login --username AWS --password-stdin ${ACCOUNT_ID}.dkr.ecr.ap-northeast-2.amazonaws.com

# docker build --no-cache -t dev/sonarqube ../../docker || exit 1
docker build -t dev/sonarqube ../../docker || exit 1

docker tag dev/sonarqube:latest ${ACCOUNT_ID}.dkr.ecr.ap-northeast-2.amazonaws.com/dev/sonarqube:latest

docker push ${ACCOUNT_ID}.dkr.ecr.ap-northeast-2.amazonaws.com/dev/sonarqube:latest
