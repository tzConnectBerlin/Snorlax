#if !LAMBDA_COMPILE_HELPER
#define LAMBDA_COMPILE_HELPER

#include "../common/common.mligo"

let pack_endpoint_lambda ( f : endpoint_lambda ) : bytes =
	Bytes.pack(f)

#endif