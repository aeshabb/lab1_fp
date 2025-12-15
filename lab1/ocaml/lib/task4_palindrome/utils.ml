(* Вспомогательные функции для задачи 4 *)

(* Вычисление границ N-значных чисел *)
let compute_bounds digits =
  let rec pow10 n = if n = 0 then 1 else 10 * pow10 (n - 1) in
  (pow10 digits - 1, pow10 (digits - 1))

(* Проверка, является ли число палиндромом *)
let is_palindrome n =
  let str = string_of_int n in
  let len = String.length str in
  let rec check i =
    if i >= len / 2 then true
    else if str.[i] <> str.[len - 1 - i] then false
    else check (i + 1)
  in
  check 0
