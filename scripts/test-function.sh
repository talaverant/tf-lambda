#!/bin/sh

set -e
clear

# Look up the URL
echo "Getting URL"
BASE_URL=$(kubectl -n flux-system get secret aws-lambda-output -o jsonpath='{.data.base_url}' | base64 --decode)

read -p "Name: " NAME
read -p "Greeting: " GREETING

URL="${BASE_URL}/hello"
if [ -n "$NAME" -o -n "$GREETING" ]
then
    URL="${URL}?"
fi

if [ -n "$NAME" ]
then
    URL="${URL}Name=${NAME}&"
fi

if [ -n "$GREETING" ]
then
    URL="${URL}Greeting=${GREETING}"
fi

echo ""
echo "Calling $URL"
echo ""

curl "$URL"
