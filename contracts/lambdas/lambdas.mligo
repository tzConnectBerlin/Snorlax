#include "../common.mligo"
#include "./lambda_compile_helper.mligo"

let add : nat_nat_2_nat = fun (a, b : nat * nat) ->
	a + b

let magic : nat_nat_2_nat = fun (a, b : nat * nat) ->
	let a = a * 2n in
	a + b

let double : nat_2_nat = fun (a : nat) ->
	a * 2n
