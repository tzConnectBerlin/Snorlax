#!/bin/bash

#usage: buildlambda.sh {type} {function name}

ligo run-function ../contracts/lambdas.mligo "pack_$1_function" "$2"