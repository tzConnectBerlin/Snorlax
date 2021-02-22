m4_changequote m4_dnl
m4_changequote(«,») m4_dnl
m4_ifdef(«LAZY_ENDPOINT_HELPER»,,«m4_define(«LAZY_ENDPOINT_HELPER»,1) m4_dnl
m4_include(m4_helpers.m4) m4_dnl
m4_loadfile(../common,lazyloading.mligo.m4) m4_dnl
m4_loadfile(../common,business_endpoint.mligo.m4) m4_dnl
m4_loadfile(.,storage.mligo.m4) m4_dnl
m4_loadfile(.,callback_helper.mligo.m4) m4_dnl

//
// This file should be unaffected by changes to business logic
// Treat it as a framework file
//

let business_endpoint_dispatch ( lambda_id, packed_params, container_storage : lambda_id * bytes * container_storage ) : operation list * container_storage =
//	let u = enforce_reentrancy_lock container_storage.callback_lambda in
	let lambda_map = container_storage.lambda_repository.lambda_map in
	let business_storage = container_storage.business_storage in
	let operations, new_storage = run_business_endpoint_lambda ( lambda_id, lambda_map, ( packed_params, lambda_map, business_storage )) in
	operations, { container_storage with business_storage = new_storage }

») m4_dnl
