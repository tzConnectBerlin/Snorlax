How to build:

There are scripts in ./build:

preprocessor.sh : Runs the m4 build of a source file, and outputs a monolithic LIGO file in ./tmp

compile-contract.sh : Compiles a contract from a given LIGO file, and outputs Michelson to ./bin
compile-lambda.sh : Compiles a lambda function from a given LIGO file, and outputs Michelson to ./bin
pack-lambda.sh : Compiles a lambda function from a given LIGO file, and outputs a packed bytestream to ./bin