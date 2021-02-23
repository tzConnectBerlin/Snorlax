# Snorlax - Lazy functions and typing in LIGO

We have developed this framework to overcome the contract size limit in Tezos. The goal is to reduce the size of the main body of the contract, and have business logic in lazily loaded Lambda functions.

The framework relies heavily on the m4 templating language for parametric macros, since the preprocessor provided by the LIGO compiler wasn't adequate to our needs. Agreeing with Jane Street OCaml guru Yaron Minsky, we believe that writing almost the same code twice is one too much. So please bear with our almost 45 year old templating language. We have are using prefixed m4 (prefixing every m4 builtin with m4_), and configured m4 quotes to be « and » so as not to interfere with anything in the LIGO code.

We organized the code in a way so that code dependent on business logic is separated from generic code powering the lazy loading mechanism.

## How to build:

There are scripts in ./build:

* preprocess.sh : Runs the m4 build of a source file, and outputs a monolithic LIGO file in ./tmp
* compile-contract.sh : Compiles a contract from a given LIGO file, and outputs Michelson to ./bin
* compile-lambda.sh : Compiles a lambda function from a given LIGO file, and outputs Michelson to ./bin
* pack-lambda.sh : Compiles a lambda function from a given LIGO file, and outputs a packed bytestream to ./bin