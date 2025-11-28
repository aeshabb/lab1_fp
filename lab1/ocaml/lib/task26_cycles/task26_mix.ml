open Utils

(* Модульная реализация: генерация, отображение, фильтрация, свёртка *)
let longest_cycle_modular limit =
  (* Генерация последовательности чисел от 2 до limit-1 *)
  let numbers = List.init (limit - 2) (fun i -> i + 2) in

  (* Отображение: для каждого числа вычисляем длину цикла *)
  let with_cycles = List.map (fun d -> (d, cycle_length d)) numbers in

  (* Свёртка: находим пару с максимальной длиной цикла *)
  let max_pair =
    List.fold_left
      (fun (max_d, max_len) (d, len) ->
        if len > max_len then (d, len) else (max_d, max_len))
      (0, 0) with_cycles
  in
  fst max_pair

(* Альтернативная реализация с filter *)
let longest_cycle_filter limit =
  let numbers = List.init (limit - 2) (fun i -> i + 2) in

  (* Создаем список пар (число, длина_цикла) *)
  let pairs = List.map (fun d -> (d, cycle_length d)) numbers in

  (* Находим максимальную длину *)
  let max_len = List.fold_left (fun acc (_, len) -> max acc len) 0 pairs in

  (* Фильтруем только элементы с максимальной длиной и берем первый *)
  match List.filter (fun (_, len) -> len = max_len) pairs with
  | (d, _) :: _ -> d
  | [] -> 0
