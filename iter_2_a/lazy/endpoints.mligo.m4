m4_changequote m4_dnl
m4_changequote(«,») m4_dnl
m4_ifdef(«ENDPOINTS»,,«m4_define(«ENDPOINTS»,1) m4_dnl
m4_include(m4_helpers.m4) m4_dnl
m4_loadfile(../common,logic_interface.mligo.m4) m4_dnl
m4_loadfile(../common,lazy_endpoint_helper.mligo.m4) m4_dnl

let add_endpoint : endpoint_lambda = fun ( argument, container_storage : bytes * container_storage ) ->
	let argument = unpack_add_params argument in
	let new_storage = container_storage.storage + argument in
	( [] : operation list ), { container_storage with storage = new_storage }

let add_double_endpoint : endpoint_lambda = fun ( argument, container_storage : bytes * container_storage ) ->
	let argument = unpack_add_params argument in
	let lambda_map = container_storage.lambda_repository.lambda_map in
	let double = argument * 2n in
	run_endpoint_lambda ( "add", lambda_map, ( Bytes.pack double, container_storage ) )

let ratio_endpoint : endpoint_lambda = fun ( argument, container_storage : bytes * container_storage ) ->
	let argument = unpack_ratio_params argument in
	let new_storage = ( container_storage.storage * argument.numerator ) / argument.denominator in
	( [] : operation list ), { container_storage with storage = new_storage }

») m4_dnl
