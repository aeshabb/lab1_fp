open Utils

(* Генерация через map *)
let largest_palindrome_map digits =
  let max_num, min_num = compute_bounds digits in

  let numbers = List.init (max_num - min_num + 1) (fun i -> min_num + i) in

  (* Для каждого числа i генерируем все произведения i*j где j <= i *)
  let all_products =
    List.concat_map
      (fun i ->
        List.map (fun j -> i * j) (List.filter (fun j -> j <= i) numbers))
      numbers
  in

  (* Фильтруем палиндромы и находим максимум *)
  all_products |> List.filter is_palindrome |> List.fold_left max 0
