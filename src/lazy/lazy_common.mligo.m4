m4_changequote m4_dnl
m4_changequote(«,») m4_dnl
m4_ifdef(«LAZY_COMMON»,,«m4_define(«LAZY_COMMON»,1) m4_dnl
m4_include(m4_helpers.m4) m4_dnl
m4_loadfile(../common,lazyloading.mligo.m4) m4_dnl
m4_loadfile(../common,business_interface.mligo.m4) m4_dnl

DECLARE_LAMBDA(«nat_dyadic», «(nat * nat)», «nat»)

LAZY_TYPE(add_params)

») m4_dnl
