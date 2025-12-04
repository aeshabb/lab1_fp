open Utils

(* Реализация с использованием List.map *)
let longest_cycle_map limit =
  (* Генерируем список чисел от 2 до limit-1 *)
  let numbers = List.init (limit - 2) (fun i -> i + 2) in

  (* Для каждого числа вычисляем длину цикла *)
  let pairs = List.map (fun d -> (d, cycle_length d)) numbers in

  (* Находим число с максимальной длиной цикла *)
  let max_d, _ =
    List.fold_left
      (fun (max_d, max_len) (d, len) ->
        if len > max_len then (d, len) else (max_d, max_len))
      (0, 0) pairs
  in
  max_d
