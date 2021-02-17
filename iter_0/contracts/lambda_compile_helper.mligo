#include "./common.mligo"

let pack_nat_2_nat_function ( f : nat_2_nat ) : bytes =
	Bytes.pack(f)

let pack_nat_nat_2_nat_function ( f : nat_nat_2_nat ) : bytes =
	Bytes.pack(f)
