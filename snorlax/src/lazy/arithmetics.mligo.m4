m4_changequote m4_dnl
m4_changequote(«,») m4_dnl
m4_ifdef(«ARITHMETICS»,,«m4_define(«ARITHMETICS»,1) m4_dnl
m4_include(m4_helpers.m4) m4_dnl

// Some Mickey Mouse arithmetics so the focus stays on the framework ;)

let add ( a, b : nat * nat ) : nat =
	a + b

let mul ( a, b : nat * nat ) : nat =
	a * b

let div ( a, b : nat * nat ) : nat =
	a / b

») m4_dnl
