m4_changequote m4_dnl
m4_changequote(«,») m4_dnl
m4_ifdef(«BUSINESS_ENDPOINT»,,«m4_define(«BUSINESS_ENDPOINT»,1) m4_dnl
m4_include(m4_helpers.m4) m4_dnl
m4_loadfile(.,lazyloading.mligo.m4) m4_dnl
m4_loadfile(.,business_interface.mligo.m4) m4_dnl

//
// This file should be unaffected by changes to business logic
// Treat it as a framework file
//

DECLARE_LAMBDA(«business_endpoint», «( bytes * lambda_map * business_storage )», «( operation list * business_storage )») m4_dnl

»)