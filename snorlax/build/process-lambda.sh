#!/bin/bash

if [[ -z "${1}" ]]; then
echo "Usage: ./compile-lambda.sh {lambda file}"
echo "Eg. ./compile-lambda.sh tmp/endpoints.mligo"
exit 1
fi

m4_filename=${1##*/}
preprocessed_source_filename="${m4_filename%.[^.]*}"
preprocessed_source_with_path="./tmp/${preprocessed_source_filename}"

mkdir -p tmp
./preprocess.sh ${1} ${preprocessed_source_with_path}

lambda_name=${preprocessed_source_filename%.*}
lambda_type="${preprocessed_source_filename%%.*}_lambda"

mkdir -p bin/lazy
ligo compile-expression --init-file=${preprocessed_source_with_path} cameligo f > bin/lazy/${lambda_name}.tz
ligo run-function ${preprocessed_source_with_path} pack_${lambda_type} f > bin/lazy/${lambda_name}.hex
