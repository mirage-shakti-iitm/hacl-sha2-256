open Lwt.Infix

module Sha256Test (Time : Mirage_time_lwt.S) = struct
    
    let red s =
        "\027[0;31m" ^ s ^ "\027[0m"

    let green s =
        "\027[0;32m" ^ s ^ "\027[0m"

    let start _time =
        let input_string = "Nandi Ganesha" in
    	let input_hex = Hex.of_string input_string in
        let _ = print_endline ("Input String: " ^ input_string) in
        let _ = print_endline ("Input Hex: " ^ (Hex.show input_hex)) in
       	let input_cstruct = Hex.to_cstruct input_hex in
        (* let input_string = Cstruct.to_string input_cstruct in  *)
        let _ = print_endline ("Input Length: " ^ (string_of_int (Cstruct.len input_cstruct))) in
       	let hash_cstruct = Hacl_sha2_256.sha256_hash input_cstruct in
       	let hash_hex = Hex.of_cstruct hash_cstruct in
        (* let _ = Cstruct.hexdump hash_cstruct in *)
        let hash_string = Hex.show hash_hex in
        let _ = print_endline ("Calculated Hash: " ^ hash_string) in
        let hash_expected = 
            {|37693f1f74485d5e6f04af6fe00035b54bb5bad00809f2e3ff072289046cb33f|} in
        let _ = print_endline ("Expected Hash: " ^ hash_string) in
       	let res = Eqaf.equal hash_string hash_expected in
        if res then print_endline (green "\n****************SUCCESS****************\n") else print_endline (red "\n****************FAILURE****************\n");
        Lwt.return_unit
end
