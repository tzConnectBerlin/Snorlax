      


 
          
type storage = nat

type add_params = nat

type ratio_params =
[@layout:comb]
{
	numerator : nat;
	denominator : nat;
}

                    
let err_NO_SUCH_LAMBDA = "No such lambda"
let err_INVALID_LAMBDA = "Invalid lambda type"

type lambda_id = string

type lambda_map = ( lambda_id, bytes ) big_map

type lambda_repository =
[@layout:comb]
{
	creator : address option;
	lambda_map : lambda_map;
}

 
           
type container_storage =
[@layout:comb]
{
	lambda_repository : lambda_repository;
	storage : storage;
}



type addish_endpoint_params = ( add_params * container_storage )

type addish_endpoint_return = ( operation list * container_storage )

type addish_endpoint_lambda = addish_endpoint_params -> addish_endpoint_return

let run_addish_endpoint_lambda ( lambda_id, lambda_map, params : lambda_id * lambda_map * addish_endpoint_params ) : addish_endpoint_return =
	let packed_code = match Big_map.find_opt lambda_id lambda_map with
	| None -> ( failwith err_NO_SUCH_LAMBDA : bytes )
	| Some e -> e in
	let lambda = match ( ( Bytes.unpack packed_code ) : addish_endpoint_lambda option ) with
	| None -> ( failwith err_INVALID_LAMBDA : addish_endpoint_lambda )
	| Some e -> e in
	lambda params

// This is only a helper for compilation - ligo won't include it in the contract code since it isn't used
let pack_addish_endpoint_lambda ( lambda : addish_endpoint_lambda ) : bytes =
	Bytes.pack lambda

 

type ratioish_endpoint_params = ( ratio_params * container_storage )

type ratioish_endpoint_return = ( operation list * container_storage )

type ratioish_endpoint_lambda = ratioish_endpoint_params -> ratioish_endpoint_return

let run_ratioish_endpoint_lambda ( lambda_id, lambda_map, params : lambda_id * lambda_map * ratioish_endpoint_params ) : ratioish_endpoint_return =
	let packed_code = match Big_map.find_opt lambda_id lambda_map with
	| None -> ( failwith err_NO_SUCH_LAMBDA : bytes )
	| Some e -> e in
	let lambda = match ( ( Bytes.unpack packed_code ) : ratioish_endpoint_lambda option ) with
	| None -> ( failwith err_INVALID_LAMBDA : ratioish_endpoint_lambda )
	| Some e -> e in
	lambda params

// This is only a helper for compilation - ligo won't include it in the contract code since it isn't used
let pack_ratioish_endpoint_lambda ( lambda : ratioish_endpoint_lambda ) : bytes =
	Bytes.pack lambda

 
    
let add : addish_endpoint_lambda = fun ( argument, container_storage : add_params * container_storage ) ->
	let new_storage = container_storage.storage + argument in
	( [] : operation list ), { container_storage with storage = new_storage }

let add_double : addish_endpoint_lambda = fun ( argument, container_storage : add_params * container_storage ) ->
	let lambda_map = container_storage.lambda_repository.lambda_map in
	let double = argument * 2n in
	run_addish_endpoint_lambda ( "add", lambda_map, ( double, container_storage ) )

let ratio : ratioish_endpoint_lambda = fun ( argument, container_storage : ratio_params * container_storage ) ->
	let new_storage = ( container_storage.storage * argument.numerator ) / argument.denominator in
	( [] : operation list ), { container_storage with storage = new_storage }

 