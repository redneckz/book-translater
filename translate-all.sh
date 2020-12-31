#!/usr/bin/env bash

IAM_TOKEN="${IAM_TOKEN:-$(yc iam create-token)}"
FOLDER_ID="${FOLDER_ID:-b1g2id1srb6fsqjars41}"

for file in "$@"; do
    echo Translate "${file}"
    ./translate.sh "${file}" \
        || echo FAIL: Translation of "${file}" has failed >&2
    echo SUCCESS: Translation of "${file}" has completed
done
