#!/usr/bin/env bash

if [ -z "$1" ]
  then
    echo "No argument supplied"
    docker run -it -p 8888:8888 \
        --mount type=bind,source="$(pwd)",target=/usr/src/app \
        -e AWS_ACCESS_KEY_ID=$(aws --profile default configure get aws_access_key_id) \
        -e AWS_SECRET_ACCESS_KEY=$(aws --profile default configure get aws_secret_access_key) \
        -e AWS_DEFAULT_REGION=$(aws configure get region) \
        -e ENVIRONMENT=$ENVIRONMENT \
        -e BUCKET=$BUCKET \
        -t pmip:latest
else
    docker run -it -p 8888:8888 \
        --mount type=bind,source="$(pwd)",target=/usr/src/app \
        -e AWS_ACCESS_KEY_ID=$(aws --profile default configure get aws_access_key_id) \
        -e AWS_SECRET_ACCESS_KEY=$(aws --profile default configure get aws_secret_access_key) \
        -e AWS_DEFAULT_REGION=$(aws configure get region) \
        -e ENVIRONMENT=$ENVIRONMENT \
        -e BUCKET=$BUCKET \
        -t pmip:latest "$@"
fi
