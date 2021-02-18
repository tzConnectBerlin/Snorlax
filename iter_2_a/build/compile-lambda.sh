#!/bin/bash

if [[ -z "${1}" ]]; then
echo "Usage: ./compile-lambda.sh {tmp filename} {lambda name}"
echo "Eg. ./compile-lambda.sh tmp/endpoints.mligo add_endpoint"
exit 1
fi

mkdir -p bin
ligo compile-expression --init-file=${1} cameligo ${2} > bin/${2}.tz