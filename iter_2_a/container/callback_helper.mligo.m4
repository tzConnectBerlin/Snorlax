m4_changequote m4_dnl
m4_changequote(«,») m4_dnl
m4_ifdef(«CALLBACK_HELPER»,,«m4_define(«CALLBACK_HELPER»,1) m4_dnl
m4_include(m4_helpers.m4) m4_dnl
m4_loadfile(../common,lazyloading.mligo.m4) m4_dnl
m4_loadfile(../common,business_endpoint.mligo.m4) m4_dnl
m4_loadfile(.,storage.mligo.m4) m4_dnl

//
// This file should be unaffected by changes to business logic
// Treat it as a framework file
//

//
// This is literally just stream-of-consciousness braindump for (hopefully) safe(r) callbacks...
//
// Don't copy it or use in production for heaven's sake!
// ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// Comments and criticism are welcome tho.
//

//let err_INVALID_REENTRANCY = "Access denied: Invalid reentrant call"
//let err_INVALID_CALLBACK = "Access denied: Invalid callback attempt"
//let err_MISSED_CALLBACK = "Stuck in invalid state, reverting"

//let enforce_reentrancy_lock ( lambda : business_endpoint_lambda option ) : Unit =
//	match lambda with
//	| Some u -> ( failwith err_INVALID_REENTRANCY : unit )
//	| None -> unit

//let callback_endpoint_dispatch ( packed_params, container_storage : bytes * container_storage ) : operation list * container_storage =
//	let callback_lambda = match container_storage.callback_lambda with
//	| None -> ( failwith err_INVALID_CALLBACK : business_endpoint_lambda )
//	| Some e -> e in
//	let operations, new_storage = callback_lambda ( packed_params, container_storage.lambda_map, container_storage.business_storage ) in
//	operations, { container_storage with
//		callback_lambda = ( None : business_endpoint_lambda option );
//		business_storage = new_storage }

// To be inserted as last element in the callchain (thank you Edo for depth-first ordering!)
//let callback_invariant_check ( container_storage : container_storage ) : operation list * container_storage =
//	match container_storage.callback_lambda with
//	| Some u -> ( failwith err_MISSED_CALLBACK : operation list * container_storage )
//	| None -> ( [] : operation list ), container_storage

») m4_dnl