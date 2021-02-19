m4_changequote m4_dnl
m4_changequote(«,») m4_dnl
m4_ifdef(«STORAGE»,,«m4_define(«STORAGE»,1) m4_dnl
m4_include(m4_helpers.m4) m4_dnl
m4_loadfile(../common,lazyloading.mligo.m4) m4_dnl
m4_loadfile(../common,business_interface.mligo.m4) m4_dnl

//
// This file should be unaffected by changes to business logic
// Treat it as a framework file
//
// Hint: define business storage in common/business_interface.mligo.m4
//

type lambda_repository =
[@layout:comb]
{
	creator : address option;
	lambda_map : lambda_map;
}

type container_storage =
[@layout:comb]
{
	lambda_repository : lambda_repository;
	business_storage : business_storage;
}

»)