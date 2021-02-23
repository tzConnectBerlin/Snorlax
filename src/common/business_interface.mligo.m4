m4_changequote m4_dnl
m4_changequote(«,») m4_dnl
m4_ifdef(«BUSINESS_INTERFACE»,,«m4_define(«BUSINESS_INTERFACE»,1) m4_dnl
m4_include(m4_helpers.m4) m4_dnl

//
// The framework relies on your business logic storage being named business_storage
//
type business_storage = nat

//
// Define business call parameters here:
//

type add_params = nat

type ratio_params =
[@layout:comb]
{
	numerator : nat;
	denominator : nat;
}

») m4_dnl
