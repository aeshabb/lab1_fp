open Utils

(* Хвостовая рекурсия - поиск наибольшего палиндрома *)
let largest_palindrome_tail_rec digits =
  let max_num = int_of_float (10.0 ** float_of_int digits) - 1 in
  let min_num = int_of_float (10.0 ** float_of_int (digits - 1)) in

  let rec find_max i j best =
    if i < min_num then best
    else if j < i then find_max (i - 1) max_num best
    else
      let product = i * j in
      if product <= best then find_max (i - 1) max_num best
      else if is_palindrome product then find_max i (j - 1) (max product best)
      else find_max i (j - 1) best
  in
  find_max max_num max_num 0

(* Обычная рекурсия *)
let largest_palindrome_rec digits =
  let max_num = int_of_float (10.0 ** float_of_int digits) - 1 in
  let min_num = int_of_float (10.0 ** float_of_int (digits - 1)) in

  let rec aux i j =
    if i < min_num then 0
    else if j < i then aux (i - 1) max_num
    else
      let product = i * j in
      if is_palindrome product then max product (aux i (j - 1))
      else aux i (j - 1)
  in
  aux max_num max_num
