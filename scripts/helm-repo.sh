#!/bin/sh

flux create source helm tf-controller \
    --url=https://weaveworks.github.io/tf-controller \
    --interval=1h \
    --export
