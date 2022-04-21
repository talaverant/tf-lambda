#!/bin/sh

flux create source git tf-lambda \
    --url=ssh://git@github.com/steveww/tf-lambda \
    --branch=main \
    --interval=30s \
    --secret-ref=ssh-credentials \
    --export
