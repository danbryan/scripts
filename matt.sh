#!/bin/bash
set -ex

BUCKET="bucket=domain-terraform-remote-state-storage-s3"

COMMAND=$1
ACCOUNTS=$2
MODULEPATH=$3

MODULENAME=$(echo $MODULEPATH | sed 's/.*\///')

IFS=',' read -a ACCOUNTARRAY <<< "$ACCOUNTS"
for ACCOUNT in ${ACCOUNTARRAY[@]}
do
    tf init -reconfigure \
    -backend-config="$BUCKET" \
    -backend-config="key="$ACCOUNT"-$MODULENAME.tfstate" \
    "$MODULEPATH"

    tf $COMMAND -var account_id="$ACCOUNT" "$MODULEPATH"
done
