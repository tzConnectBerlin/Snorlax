m4_changequote m4_dnl
m4_changequote(«,») m4_dnl
m4_ifdef(«ADD_DOUBLE»,,«m4_define(«ADD_DOUBLE»,1) m4_dnl
m4_include(m4_helpers.m4) m4_dnl
m4_loadfile(../../common,business_interface.mligo.m4) m4_dnl
m4_loadfile(../../common,lazy_endpoint.mligo.m4) m4_dnl
m4_loadfile(..,arithmetics.mligo.m4) m4_dnl
m4_loadfile(..,lazy_common.mligo.m4) m4_dnl

// add_double
// Endpoint lambda that calls internal_add to add double of its argument to the business storage
let f : business_endpoint_lambda = fun ( argument, business_storage : bytes * business_storage ) ->
	let argument = unpack_add_params argument in
	let double = mul ( argument, 2n ) in
	let new_storage = add ( business_storage, double ) in
	( [] : operation list ), new_storage

»)