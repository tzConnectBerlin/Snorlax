m4_changequote m4_dnl
m4_changequote(«,») m4_dnl
m4_ifdef(«ENDPOINTS»,,«m4_define(«ENDPOINTS»,1) m4_dnl
m4_include(m4_helpers.m4) m4_dnl
m4_loadfile(../common,business_interface.mligo.m4) m4_dnl
m4_loadfile(../common,business_endpoint.mligo.m4) m4_dnl

LAZY_TYPE(add_params)
LAZY_TYPE(ratio_params)

let add_endpoint : business_endpoint_lambda = fun ( argument, lambda_map, business_storage : bytes * lambda_map * business_storage ) ->
	let argument = unpack_add_params argument in
	let business_storage = business_storage + argument in
	( [] : operation list ), business_storage

let add_double_endpoint : business_endpoint_lambda = fun ( argument, lambda_map, business_storage : bytes * lambda_map * business_storage ) ->
	let argument = unpack_add_params argument in
	let double = argument * 2n in
	run_business_endpoint_lambda ( "add", lambda_map, ( Bytes.pack double, lambda_map, business_storage ) )

let ratio_endpoint : business_endpoint_lambda = fun ( argument, lambda_map, business_storage : bytes * lambda_map * business_storage ) ->
	let argument = unpack_ratio_params argument in
	let business_storage = ( business_storage * argument.numerator ) / argument.denominator in
	( [] : operation list ), business_storage

») m4_dnl
