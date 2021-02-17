m4_changequote(«,») m4_dnl
m4_include(m4_helpers.m4) m4_dnl
m4_loadfile(../common,lazyloading.mligo.m4) m4_dnl
m4_loadfile(../common,lazy_endpoint_helper.mligo.m4) m4_dnl
m4_loadfile(.,facade.mligo.m4) m4_dnl

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
