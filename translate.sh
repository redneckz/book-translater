#!/usr/bin/env bash
set -e

IAM_TOKEN="${IAM_TOKEN:-$(yc iam create-token)}"
FOLDER_ID="${FOLDER_ID:-b1g2id1srb6fsqjars41}"

INPUT=$1
OUTPUT="${1%.*}.ru.txt"

request-body() {
    local text
    text=$(cat "${INPUT}")
    jq -n \
        --arg folder_id "${FOLDER_ID}" \
        --arg text "${text}" \
        '{ folder_id: $folder_id, targetLanguageCode: "ru", texts: [$text] }'
}

do-request() {
    request-body | curl -X POST \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer ${IAM_TOKEN}" \
        --data-binary @- \
        "https://translate.api.cloud.yandex.net/translate/v2/translate" \
            | jq -r '.translations[0].text'
}

do-request > "${OUTPUT}"
