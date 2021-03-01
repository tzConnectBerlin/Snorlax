# 'Snorlax' - Lazy functions and typing in LIGO

We have developed this framework to overcome the contract size limit in Tezos. The goal is to reduce the size of the main body of the contract, and have business logic in lazily loaded Lambda functions.

The framework relies heavily on the m4 templating language for parametric macros, since the preprocessor provided by the LIGO compiler wasn't adequate to our needs. Agreeing with Jane Street OCaml guru Yaron Minsky, we believe that writing almost the same code twice is one too much. So please bear with our almost 45 year old templating language. We are using prefixed m4 (prefixing every m4 builtin with m4_), and configured m4 quotes to be « and » so as not to interfere with anything in the LIGO code.

We organized the code in a way so that code dependent on business logic is separated from generic code powering the lazy loading mechanism.

## Snorlax and Munchlax

We provide you with not one, but two examples. Munchlax is a leaner solution that doesn't allow lambdas to call other lambdas. Snorlax is the full featured real deal. (You might have very good reasons not to use the "full featured real deal" though. Please use your engineer's gut intuition.) The source trees are under their respective folders.

## How to build and install:

* Start the flextesa sandbox by running pull.sh and start.sh in /flextesa

* Run build.sh in /build

* Run install.sh in /build

The preprocessed LIGO source files can be inspected under build/tmp, and the Michelson and packed bytestream output can be found under build/bin.

## Disclaimer

I attempted to make this as secure by design as possible, but remember this whole example was built by one person over a week.