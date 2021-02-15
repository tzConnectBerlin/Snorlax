#include "./common.mligo"

let run_nat_2_nat_function ( packed_f, param : bytes * nat ) : nat =
	let f = match ( ( Bytes.unpack packed_f ) : nat_2_nat option ) with
	| None -> ( failwith "Invalid lambda type" : nat_2_nat )
	| Some f -> f in
	f param

let run_nat_nat_2_nat_function ( packed_f, param : bytes * ( nat * nat ) ) : nat =
	let f = match ( ( Bytes.unpack packed_f ) : nat_nat_2_nat option ) with
	| None -> ( failwith "Invalid lambda type" : nat_nat_2_nat )
	| Some f -> f in
	f param