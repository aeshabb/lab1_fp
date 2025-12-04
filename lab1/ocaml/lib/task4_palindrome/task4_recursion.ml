open Utils

(* Вычисление границ N-значных чисел *)
let compute_bounds digits =
  let rec pow10 n = if n = 0 then 1 else 10 * pow10 (n - 1) in
  (pow10 digits - 1, pow10 (digits - 1))

(* Хвостовая рекурсия - поиск наибольшего палиндрома *)
let largest_palindrome_tail_rec digits =
  let max_num, min_num = compute_bounds digits in

  let rec find_max i j best =
    if i < min_num then best
    else if j < i then find_max (i - 1) max_num best
    else
      let product = i * j in
      (* Оптимизация: если product <= best, переходим к следующему i *)
      if product <= best then find_max (i - 1) max_num best
      else
        let new_best =
          if is_palindrome product then max product best else best
        in
        find_max i (j - 1) new_best
  in
  find_max max_num max_num 0

(* Обычная рекурсия *)
let largest_palindrome_rec digits =
  let max_num, min_num = compute_bounds digits in

  let rec aux i j =
    if i < min_num then 0
    else if j < i then aux (i - 1) max_num
    else
      let product = i * j in
      (* Используем функцию для ленивого вычисления - избегаем дублирования *)
      let compute_next () = aux i (j - 1) in
      if is_palindrome product then max product (compute_next ())
      else compute_next ()
  in
  aux max_num max_num
