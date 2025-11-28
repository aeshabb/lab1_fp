(* Вспомогательные функции для задачи 26 *)

(* Вычисление длины повторяющегося цикла в десятичном представлении 1/d *)
let cycle_length d =
  let rec find_cycle remainders remainder pos =
    if remainder = 0 then 0
    else
      match List.assoc_opt remainder remainders with
      | Some start_pos -> pos - start_pos
      | None ->
          let next_remainder = (remainder * 10) mod d in
          find_cycle ((remainder, pos) :: remainders) next_remainder (pos + 1)
  in
  find_cycle [] 1 0
