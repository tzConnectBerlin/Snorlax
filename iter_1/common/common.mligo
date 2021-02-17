#if !COMMON
#define COMMON

let err_NO_SUCH_LAMBDA = "No such lambda"
let err_INVALID_LAMBDA = "Invalid lambda type"

type lambda_id = string

type storage = nat

type lambda_repository = ( lambda_id, bytes ) big_map

type container_storage =
[@layout:comb]
{
	creator : address;
	is_sealed : bool;
	lambda_repository : lambda_repository;
	storage : storage;
}

type endpoint_argument = nat

type endpoint_lambda = ( endpoint_argument * container_storage ) -> ( operation list * container_storage )

let unpack_endpoint_lambda ( lambda_id, lambda_repository : lambda_id * lambda_repository ) : endpoint_lambda =
	let packed_code = match Big_map.find_opt lambda_id lambda_repository with
	| None -> ( failwith err_NO_SUCH_LAMBDA : bytes )
	| Some e -> e in
	match ( ( Bytes.unpack packed_code ) : endpoint_lambda option ) with
	| None -> ( failwith err_INVALID_LAMBDA : endpoint_lambda )
	| Some e -> e

#endif