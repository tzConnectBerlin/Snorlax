m4_changequote m4_dnl
m4_changequote(«,») m4_dnl
m4_ifdef(«MAIN»,,«m4_define(«MAIN»,1) m4_dnl
m4_include(m4_helpers.m4) m4_dnl
m4_loadfile(.,storage.mligo.m4) m4_dnl
m4_loadfile(.,installer.mligo.m4) m4_dnl
m4_loadfile(.,lazy_endpoint_helper.mligo.m4) m4_dnl

type main_action =
	| Installer of installer_action
	| Add of add_params
	| AddDouble of add_params
	| Ratio of ratio_params

let main ( action, container_storage : main_action * container_storage) : operation list * container_storage =
	match action with
	| Installer params -> installer_dispatch ( params, container_storage )
	| Add params -> business_endpoint_dispatch ( "add", Bytes.pack params, container_storage )
	| AddDouble params -> business_endpoint_dispatch ( "add_double", Bytes.pack params, container_storage )
	| Ratio params -> business_endpoint_dispatch ( "ratio", Bytes.pack params, container_storage )

») m4_dnl
