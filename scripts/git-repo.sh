#!/bin/sh

flux create source git tf-lambda \
    --url=ssh://git@github.com/talaverant/tf-lambda \
    --branch=main \
    --interval=30s \
    --export
