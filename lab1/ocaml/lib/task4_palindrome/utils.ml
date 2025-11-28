(* Вспомогательные функции для задачи 4 *)

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
