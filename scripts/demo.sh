#!/bin/bash

clear

# pull in the magic
. $HOME/Documents/code/demo-magic/demo-magic.sh

TMP_FILE=$(mktemp)
trap "rm -f $TMP_FILE" 0 1 2 3

# Config
PROMPT_TIMEOUT=0
TYPE_SPEED=15
DEMO_PROMPT='\W $> '
SOURCE_DIR="$HOME/Documents/code/tf-lambda"
MANAGEMENT_DIR="$HOME/Documents/code/gitops/clusters/webinar"

mkdir -p "$MANAGEMENT_DIR"

pei "# Go to management repo"
cd $MANAGEMENT_DIR
pei "# Add Helm repository"
$SOURCE_DIR/scripts/helm-repo.sh > helm-repo-tf-controller.yaml
pei "cat helm-repo-tf-controller.yaml"
sleep 2
pei "clear"
pei "# Add Helm release"
$SOURCE_DIR/scripts/helm-tf-controller.sh > helm-tf-controller.yaml
pei "cat helm-tf-controller.yaml"
pei "git add ."
pei "git commit -m 'deploy terraform controller'"
pei 'git push'
sleep 2

while true
do
    clear
    pi "kubectl -n flux-system get pod"
    kubectl -n flux-system get pod | tee $TMP_FILE
    if fgrep -q tf-controller $TMP_FILE
    then
        break
    fi
    sleep 2
done
sleep 2

pei "# Terraform controller deployed via Helm"
sleep 2
pei "clear"
pei "flux get all"
sleep 2

pei "clear"
pei "# Add GitHub repo"
$SOURCE_DIR/scripts/git-repo.sh > git-repo.yaml
pei "cat git-repo.yaml"
sleep 2
pei "clear"
$SOURCE_DIR/scripts/aws-lambda.sh > aws-lambda.yaml
pei "cat aws-lambda.yaml"
sleep 2
pei "git add ."
pei "git commit -m 'deploy AWS Lambda'"
pei "git push"
sleep 2

