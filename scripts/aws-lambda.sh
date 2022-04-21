#!/bin/sh

SCRIPTPATH=$(dirname "$0")

for FILE in ${SCRIPTPATH}/manifests/*
do
  cat $FILE
done
