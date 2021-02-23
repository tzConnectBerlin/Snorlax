m4_changequote m4_dnl
m4_changequote(«,») m4_dnl
m4_ifdef(«RATIO»,,«m4_define(«RATIO»,1) m4_dnl
m4_include(m4_helpers.m4) m4_dnl
m4_loadfile(../../common,business_interface.mligo.m4) m4_dnl
m4_loadfile(../../common,business_endpoint.mligo.m4) m4_dnl

LAZY_TYPE(ratio_params)

// ratio
// Endpoint lambda that sets storage to specified ratio of itself
let f : business_endpoint_lambda = fun ( argument, lambda_map, business_storage : bytes * lambda_map * business_storage ) ->
	let argument = unpack_ratio_params argument in
	let business_storage = ( business_storage * argument.numerator ) / argument.denominator in
	( [] : operation list ), business_storage

») m4_dnl
