#!/bin/bash

if [ "$1" = "test" ]; then
    cd "v2/test" || exit
    echo "******* Deploying Resources to test ********"
    terraform init
    terraform apply -auto-approve
elif [ "$1" = "staging" ]; then
    cd "v2/staging" || exit
    echo "******* Deploying Resources to stage ********"
    terraform init
    terraform apply -auto-approve
elif [ "$1" = "main" ]; then
    cd "v2/prod" || exit
    echo "******* Deploying Resources to prod ********"
    terraform init
    terraform apply -auto-approve
else
    echo "Try again with a valid environment: test, staging or prod"
fi
