# book-translater

## Setup

Install the following:

- Bash
- [Tesseract](https://github.com/tesseract-ocr/tesseract)
- [jq](https://stedolan.github.io/jq/manual/)
- [Yandex CLI](https://cloud.yandex.ru/docs/cli/operations/install-cli)

## Usage

```
$ ./recognize.sh /some/path/*.jpg
$ ...
$ export IAM_TOKEN="$(yc iam create-token)"
$ export FOLDER_ID="b1g2id1srb6fsqjars41"
$ ./translate-all.sh /some/path/*.txt
$ ...
```
