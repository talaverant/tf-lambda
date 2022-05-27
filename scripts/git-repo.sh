#!/bin/sh

flux create source git tf-lambda \
    --url=https://github.com/talaverant/tf-lambda.git \
    --branch=main \
    --interval=30s \
    --export
