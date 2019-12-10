open Mirage

let main =
  foreign
    ~packages:[package "hacl-sha2-256"; package "eqaf"; package "hex"] 
    "Unikernel.Sha256Test" (time @-> job)

let () =
  register "sha256test" [main $ default_time]