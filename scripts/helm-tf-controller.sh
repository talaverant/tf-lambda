#!/bin/sh

flux create helmrelease tf-controller \
    --interval=1h \
    --source=HelmRepository/tf-controller \
    --chart=tf-controller \
    --chart-version='0.2.x' \
    --target-namespace=flux-system \
    --export