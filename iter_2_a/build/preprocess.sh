#!/bin/bash

if [[ -z "${1}" ]]; then
echo "Usage: ./preprocessor.sh {path to root m4 file}"
echo "Eg. ./preprocessor.sh ../common/main.mligo.m4"
exit 1
fi

working_directory=${1%/*}
filename=${1##*/}
basename="${filename%.[^.]*}"
helper_directory="../m4_helpers"

mkdir -p tmp
m4 -P -I ${helper_directory} -D "M4_WORKING_DIR=${working_directory}" ${1} > ./tmp/${basename}
