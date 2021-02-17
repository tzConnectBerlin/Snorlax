m4_changequote m4_dnl
m4_changequote(«,») m4_dnl
m4_ifdef(«LOGIC_INTERFACE»,,«m4_define(«LOGIC_INTERFACE»,1) m4_dnl
m4_include(m4_helpers.m4) m4_dnl

type storage = nat

type add_params = nat

type ratio_params =
[@layout:comb]
{
	numerator : nat;
	denominator : nat;
}

») m4_dnl
