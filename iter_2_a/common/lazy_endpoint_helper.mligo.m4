m4_changequote m4_dnl
m4_changequote(«,») m4_dnl
m4_ifdef(«LAZY_ENDPOINT_HELPER»,,«m4_define(«LAZY_ENDPOINT_HELPER»,1) m4_dnl
m4_include(m4_helpers.m4) m4_dnl
m4_loadfile(.,lazyloading.mligo.m4) m4_dnl
m4_loadfile(.,logic_interface.mligo.m4) m4_dnl

type container_storage =
[@layout:comb]
{
	lambda_repository : lambda_repository;
	storage : storage;
}

DECLARE_LAMBDA(«addish_endpoint», «( add_params * container_storage )», «( operation list * container_storage )») m4_dnl
DECLARE_LAMBDA(«ratioish_endpoint», «( ratio_params * container_storage )», «( operation list * container_storage )») m4_dnl)

») m4_dnl
