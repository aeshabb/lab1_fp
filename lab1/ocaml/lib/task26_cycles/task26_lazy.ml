open Utils

(* Реализация с использованием ленивых последовательностей *)
let longest_cycle_lazy limit =
  (* Генерируем последовательность чисел от 2 до limit-1 *)
  let rec numbers_seq d () =
    if d >= limit then Seq.Nil else Seq.Cons (d, numbers_seq (d + 1))
  in

  numbers_seq 2
  |> Seq.map (fun d -> (d, cycle_length d))
  |> Seq.fold_left
       (fun (max_d, max_len) (d, len) ->
         if len > max_len then (d, len) else (max_d, max_len))
       (0, 0)
  |> fst
