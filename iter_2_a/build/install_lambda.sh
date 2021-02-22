#!/bin/bash

tezos-client transfer 0 from alice to lazytest --burn-cap 0.5 --arg \(Right\(Left\(Left\(Right\(Pair\ \"${1}\"\ ${2}\)\)\)\)\)\

