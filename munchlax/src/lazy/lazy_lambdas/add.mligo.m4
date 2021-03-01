m4_changequote m4_dnl
m4_changequote(«,») m4_dnl
m4_ifdef(«ADD»,,«m4_define(«ADD»,1) m4_dnl
m4_include(m4_helpers.m4) m4_dnl
m4_loadfile(../../common,business_interface.mligo.m4) m4_dnl
m4_loadfile(../../common,lazy_endpoint.mligo.m4) m4_dnl
m4_loadfile(..,arithmetics.mligo.m4) m4_dnl
m4_loadfile(..,lazy_common.mligo.m4) m4_dnl

// add
// Endpoint lambda that calls internal_add to add a number to the business storage
let f : business_endpoint_lambda = fun ( argument, business_storage : bytes * business_storage ) ->
	let argument = unpack_add_params argument in
	let new_storage = add ( business_storage, argument ) in
	( [] : operation list ), new_storage

») m4_dnl
