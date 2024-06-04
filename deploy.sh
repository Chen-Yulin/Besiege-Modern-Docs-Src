#!/bin/bash

if [[ $# -eq 0 ]] ; then
    echo 'Please provide a commit message'
    exit 1
fi

export UV_USE_IO_URING=0
yarn deploy
if [ $? -ne 0 ]; then
    echo "Failed to deploy"
    exit 1
fi
git add .
git commit -m "$1"
git push src main
