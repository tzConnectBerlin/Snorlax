m4_changequote m4_dnl
m4_changequote(«,») m4_dnl
m4_ifdef(«INTERNAL_ADD»,,«m4_define(«INTERNAL_ADD»,1) m4_dnl
m4_include(m4_helpers.m4) m4_dnl
m4_loadfile(..,lazy_common.mligo.m4) m4_dnl
m4_loadfile(..,arithmetics.mligo.m4) m4_dnl

// internal_add
// Strongly typed dyadic nat lambda for adding numbers
let f : nat_dyadic_lambda = fun ( a, b : nat * nat ) ->
	add ( a, b )

») m4_dnl
