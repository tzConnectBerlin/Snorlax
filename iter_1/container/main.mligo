#include "../common/common.mligo"

let err_CONTRACT_SEALED = "Access denied: contract sealed"

type packed_lambda =
[@layout:comb]
{
	name : lambda_id;
	code : bytes;
}

type endpoint_params =
[@layout:comb]
{
	name : lambda_id;
	argument : endpoint_argument
}

type main_action =
	| InstallLambda of packed_lambda
	| SealContract of unit
	| CallEndpoint of endpoint_params

let assert_not_sealed ( container_storage : container_storage ) : unit =
	if (container_storage.is_sealed) then
		( failwith err_CONTRACT_SEALED : unit )
	else
		unit

let install_lambda ( packed_lambda, container_storage : packed_lambda * container_storage ) : operation list * container_storage =
	let u = assert_not_sealed ( container_storage ) in
	let updated_repository = Big_map.update packed_lambda.name (Some ( packed_lambda.code ) ) container_storage.lambda_repository in
	( [] : operation list ), { container_storage with lambda_repository = updated_repository }

let seal_contract ( u, container_storage : unit * container_storage ) : operation list * container_storage =
	let u = assert_not_sealed ( container_storage ) in
	( [] : operation list ), { container_storage with is_sealed = true }

let call_endpoint_lambda ( endpoint_params, container_storage : endpoint_params * container_storage ) : operation list * container_storage =
	let lambda = unpack_endpoint_lambda ( endpoint_params.name, container_storage.lambda_repository ) in
	lambda ( endpoint_params.argument, container_storage )
	
let main ( action, container_storage : main_action * container_storage) : operation list * container_storage =
	match action with
	| InstallLambda params -> install_lambda ( params, container_storage )
	| SealContract params -> seal_contract ( params, container_storage )
	| CallEndpoint params -> call_endpoint_lambda ( params, container_storage )