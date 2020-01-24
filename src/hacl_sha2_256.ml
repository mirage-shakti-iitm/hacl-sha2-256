let hash_length_bytes = 32


(* hash -> input -> input_length -> unit *)
external verified_sha256_hash :
  Cstruct.buffer -> Cstruct.buffer -> int -> unit 
  = "ml_Hacl_SHA2_256_hash"
  [@@noalloc]
(* Should check whether it should be int32 or value as 3rd parameter for the external function *)

let sha256_hash input =
  let hash = Cstruct.create hash_length_bytes in
  let input_len = Cstruct.len input in
  let _ = verified_sha256_hash (Cstruct.to_bigarray hash) (Cstruct.to_bigarray input) input_len in
  hash