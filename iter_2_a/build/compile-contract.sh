#!/bin/bash

if [[ -z "${1}" ]]; then
echo "Usage: ./compile-contract.sh {file}"
echo "Eg. ./compile-contact tmp/main.mligo"
exit 1
fi

mkdir -p bin
ligo compile-contract ${1} main > bin/${1}.tz