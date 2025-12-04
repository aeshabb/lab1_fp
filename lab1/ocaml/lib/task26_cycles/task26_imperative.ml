open Utils

(* Императивная реализация с циклами for *)
let longest_cycle_imperative limit =
  (* Используем изменяемые ссылки для отслеживания максимума *)
  let max_d = ref 0 in
  let max_len = ref 0 in

  (* Перебираем все числа от 2 до limit-1 *)
  for d = 2 to limit - 1 do
    let len = cycle_length d in
    if len > !max_len then (
      max_len := len;
      max_d := d)
  done;

  !max_d
