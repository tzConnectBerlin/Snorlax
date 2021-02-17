m4_changequote m4_dnl
m4_changequote(«,») m4_dnl
m4_ifdef(«FACADE»,,«m4_define(«FACADE»,1) m4_dnl
m4_include(m4_helpers.m4) m4_dnl
m4_loadfile(../common,lazyloading.mligo.m4) m4_dnl
m4_loadfile(../common,logic_interface.mligo.m4) m4_dnl

type packed_lambda =
[@layout:comb]
{
	name : lambda_id;
	code : bytes;
}

type installer_action =
	| InstallLambda of packed_lambda
	| DeleteLambda of lambda_id
	| SealContract

type main_action =
	| Installer of installer_action
	| Add of add_params
	| AddDouble of add_params
	| Ratio of ratio_params

») m4_dnl