    


 
          
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

 
                           
type storage = nat

type add_params = nat

type ratio_params =
[@layout:comb]
{
	numerator : nat;
	denominator : nat;
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

 
                          
type packed_lambda =
[@layout:comb]
{
	name : lambda_id;
	code : bytes;
}

type installer_action =
	| InstallLambda of packed_lambda
	| DeleteLambda of lambda_id
	| SealContract

type main_action =
	| Installer of installer_action
	| Add of add_params
	| AddDouble of add_params
	| Ratio of ratio_params

   
let err_CONTRACT_SEALED = "Access denied: contract sealed"
let err_ACCESS_DENIED = "Access denied: unauthorized caller"

let assert_installer_access_control ( lambda_repository : lambda_repository ) : unit =
	let creator = match lambda_repository.creator with
	| None -> ( failwith err_CONTRACT_SEALED : address )
	| Some addr -> addr in
	if ( creator <> Tezos.sender ) then
		( failwith err_ACCESS_DENIED : unit )
	else
		unit

[@inline]
let install_lambda ( packed_lambda, lambda_repository : packed_lambda * lambda_repository ) : lambda_repository =
	let updated_map = Big_map.update packed_lambda.name ( Some ( packed_lambda.code ) ) lambda_repository.lambda_map in
	{ lambda_repository with lambda_map = updated_map }

[@inline]
let delete_lambda ( lambda_id, lambda_repository : lambda_id * lambda_repository ) : lambda_repository =
	let updated_map = Big_map.update lambda_id ( None : bytes option ) lambda_repository.lambda_map in
	{ lambda_repository with lambda_map = updated_map }

[@inline]
let seal_contract ( lambda_repository : lambda_repository ) : lambda_repository =
	{ lambda_repository with creator = ( None : address option ) }

let installer_dispatch ( action, container_storage : installer_action * container_storage ) : operation list * container_storage =
	let lambda_repository = container_storage.lambda_repository in
	let u = assert_installer_access_control lambda_repository in
	let new_repository = match action with
	| InstallLambda params -> install_lambda ( params, lambda_repository )
	| DeleteLambda params -> delete_lambda ( params, lambda_repository )
	| SealContract -> seal_contract lambda_repository in
	( [] : operation list ), { container_storage with lambda_repository = new_repository }
	
let main ( action, container_storage : main_action * container_storage) : operation list * container_storage =
	let lambda_map = container_storage.lambda_repository.lambda_map in
	match action with
	| Installer params -> installer_dispatch ( params, container_storage )
	| Add params -> run_addish_endpoint_lambda ( "add", lambda_map, ( params, container_storage ) )
	| AddDouble params -> run_addish_endpoint_lambda ( "add_double", lambda_map, ( params, container_storage ) )
	| Ratio params -> run_ratioish_endpoint_lambda ( "ratio", lambda_map, ( params, container_storage ) )
