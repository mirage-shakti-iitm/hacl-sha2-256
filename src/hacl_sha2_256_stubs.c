// c stubs 
#include <caml/mlvalues.h>
#include <caml/bigarray.h>
#include <caml/memory.h>
#include "Hacl_SHA2_256.h"

CAMLprim value ml_Hacl_SHA2_256_hash(value hash, value input, value len) {
    CAMLparam3(hash, input, len);
    uint32_t len_32 = (uint32_t)(Int_val(len));
    Hacl_SHA2_256_hash((uint8_t*)Caml_ba_data_val(hash),(uint8_t*)Caml_ba_data_val(input),len_32);
    CAMLreturn(Val_unit);
}