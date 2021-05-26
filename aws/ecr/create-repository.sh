#!/bin/bash

export REPOSITORY_NAME=dev/sonarqube

aws ecr \
create-repository \
--repository-name $REPOSITORY_NAME
