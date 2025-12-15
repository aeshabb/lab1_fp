open Utils

(* Генерация всех произведений двух N-значных чисел *)
let generate_products digits =
  let max_num, min_num = compute_bounds digits in

  let rec gen_range from_val to_val =
    if from_val > to_val then []
    else from_val :: gen_range (from_val + 1) to_val
  in

  let numbers = gen_range min_num max_num in

  (* Генерируем все пары (i, j) где i >= j *)
  List.concat_map
    (fun i ->
      List.filter_map (fun j -> if j <= i then Some (i * j) else None) numbers)
    numbers

(* Фильтрация палиндромов и свёртка для поиска максимума *)
let largest_palindrome_fold digits =
  generate_products digits |> List.filter is_palindrome |> List.fold_left max 0
