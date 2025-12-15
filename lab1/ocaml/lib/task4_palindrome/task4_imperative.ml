open Utils

(* Императивная реализация с циклами for *)
let largest_palindrome_imperative digits =
  let max_num, min_num = compute_bounds digits in

  (* Используем изменяемую ссылку для хранения лучшего результата *)
  let best = ref 0 in

  (* Внешний цикл: i от max_num вниз до min_num *)
  for i = max_num downto min_num do
    (* Внутренний цикл: j от max_num вниз до i *)
    for j = max_num downto i do
      let product = i * j in
      (* Оптимизация: если product <= best, прерываем внутренний цикл *)
      if product > !best && is_palindrome product then best := max product !best
    done
  done;

  !best
