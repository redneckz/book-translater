#!/usr/bin/env bash

for file in "$@"; do
    echo Start recognition of "${file}"
    tesseract "${file}" "${file%.*}" -l eng \
        || echo FAIL: Recognition of "${file}" has failed >&2
    echo SUCCESS: Recognition of "${file}" has completed
done
