m4_changequote m4_dnl
m4_changequote(«,») m4_dnl
m4_ifdef(«RATIO»,,«m4_define(«RATIO»,1) m4_dnl
m4_include(m4_helpers.m4) m4_dnl
m4_loadfile(../../common,lazy_typing.mligo.m4) m4_dnl
m4_loadfile(../../common,lazy_endpoint.mligo.m4) m4_dnl
m4_loadfile(../../common,business_interface.mligo.m4) m4_dnl
m4_loadfile(..,arithmetics.mligo.m4) m4_dnl

LAZY_TYPE(ratio_params)

// ratio
// Endpoint lambda that sets storage to specified ratio of itself
let f : business_endpoint_lambda = fun ( argument, business_storage : bytes * business_storage ) ->
	let argument = unpack_ratio_params argument in
	let new_storage =  div ( ( mul ( business_storage, argument.numerator ) ), argument.denominator ) in
	( [] : operation list ), new_storage

») m4_dnl
