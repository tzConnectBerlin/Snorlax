#!/bin/bash

if [[ -z "${1}" ]]; then
echo "Usage: ./pack-lambda.sh {ligo source file} {lambda type} {lambda name}"
echo "Eg. ./pack-lambda.sh tmp/endpoints.mligo endpoint_lambda add_endpoint"
exit 1
fi

mkdir -p bin
ligo run-function ${1} pack_${2} ${3} > bin/${3}.hex
