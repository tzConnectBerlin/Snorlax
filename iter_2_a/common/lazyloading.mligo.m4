m4_changequote m4_dnl
m4_changequote(«,») m4_dnl
m4_ifdef(«LAZYLOADING»,,«m4_define(«LAZYLOADING»,1) m4_dnl
m4_include(m4_helpers.m4) m4_dnl

let err_NO_SUCH_LAMBDA  = "No such lambda"
m4_ifdef(«RELEASE»,«let err_INVALID_TYPE = "Lazy type error"»,)

type lambda_id = string

type lambda_map = ( lambda_id, bytes ) big_map

type lambda_repository =
[@layout:comb]
{
	creator : address option;
	lambda_map : lambda_map;
}

m4_define(«LAZY_TYPE»,«m4_dnl

m4_ifdef(«RELEASE»,,let err_INVALID_TYPE_$1 = "Lazy type error: expected $1") m4_dnl

let unpack_$1 ( packed_value : bytes ) : $1 =
	match ( ( Bytes.unpack packed_value ) : $1 option ) with
	| None -> ( failwith m4_ifdef(«RELEASE»,err_INVALID_TYPE,err_INVALID_TYPE_$1) : $1 )
	| Some e -> e

») m4_dnl

m4_define(«DECLARE_LAMBDA»,«m4_dnl

type $1_params = $2

type $1_return = $3

type $1_lambda = $1_params -> $1_return

LAZY_TYPE($1_lambda)

let run_$1_lambda ( lambda_id, lambda_map, params : lambda_id * lambda_map * $1_params ) : $1_return =
	let packed_code = match Big_map.find_opt lambda_id lambda_map with
	| None -> ( failwith err_NO_SUCH_LAMBDA : bytes )
	| Some e -> e in
	let lambda = unpack_$1_lambda packed_code in
	lambda params

// This is only a helper for compilation - ligo won't include it in the contract code since it isn't used
let pack_$1_lambda ( lambda : $1_lambda ) : bytes =
	Bytes.pack lambda

») m4_dnl

») m4_dnl
