# How to build:

There are scripts in ./build:

* preprocess.sh : Runs the m4 build of a source file, and outputs a monolithic LIGO file in ./tmp
* compile-contract.sh : Compiles a contract from a given LIGO file, and outputs Michelson to ./bin
* compile-lambda.sh : Compiles a lambda function from a given LIGO file, and outputs Michelson to ./bin
* pack-lambda.sh : Compiles a lambda function from a given LIGO file, and outputs a packed bytestream to ./bin

## How to fully build the test:

$ cd build

$ ./preprocess.sh ../container/main.mligo.m4

$ ./preprocess.sh ../lazy/endpoints.mligo.m4

$ ./compile-contract.sh ./tmp/main.mligo

(Michelson lambdas for verification:)

$ ./compile-lambda.sh ./tmp/endpoints.mligo add_endpoint

$ ./compile-lambda.sh ./tmp/endpoints.mligo add_double_endpoint

$ ./compile-lambda.sh ./tmp/endpoints.mligo ratio_endpoint

(Packed lambdas for installing:)

$ ./pack-lambda.sh ./tmp/endpoints.mligo endpoint_lambda add_endpoint

$ ./pack-lambda.sh ./tmp/endpoints.mligo endpoint_lambda add_double_endpoint

$ ./pack-lambda.sh ./tmp/endpoints.mligo endpoint_lambda ratio_endpoint
