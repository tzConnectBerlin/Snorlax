m4_changequote m4_dnl
m4_changequote(«,») m4_dnl
m4_ifdef(«LAZY_COMMON»,,«m4_define(«LAZY_COMMON»,1) m4_dnl
m4_include(m4_helpers.m4) m4_dnl
m4_loadfile(../common,lazy_typing.mligo.m4) m4_dnl
m4_loadfile(../common,business_interface.mligo.m4) m4_dnl

LAZY_TYPE(add_params)

») m4_dnl
