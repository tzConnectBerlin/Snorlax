#include "../common/common.mligo"
#include "./lambda_compile_helper.mligo"

let add : endpoint_lambda = fun ( argument, container_storage : endpoint_argument * container_storage ) ->
	let new_storage = container_storage.storage + argument in
	( [] : operation list ), { container_storage with storage = new_storage }

let add_double : endpoint_lambda = fun ( argument, container_storage : endpoint_argument * container_storage ) ->
	let double = argument * 2n in
	let add = unpack_endpoint_lambda ( ( "add" : lambda_id ), container_storage.lambda_repository ) in
	add ( double, container_storage )