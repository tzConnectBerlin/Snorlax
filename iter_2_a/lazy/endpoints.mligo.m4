m4_changequote m4_dnl
m4_changequote(«,») m4_dnl
m4_ifdef(«ENDPOINTS»,,«m4_define(«ENDPOINTS»,1) m4_dnl
m4_include(m4_helpers.m4) m4_dnl
m4_loadfile(../common,logic_interface.mligo.m4) m4_dnl
m4_loadfile(../common,lazy_endpoint_helper.mligo.m4) m4_dnl

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

») m4_dnl
