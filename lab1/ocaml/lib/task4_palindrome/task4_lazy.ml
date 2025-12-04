open Utils

(* Вычисление границ N-значных чисел *)
let compute_bounds digits =
  let rec pow10 n = if n = 0 then 1 else 10 * pow10 (n - 1) in
  (pow10 digits - 1, pow10 (digits - 1))

(* Генерация бесконечной последовательности произведений *)
let largest_palindrome_lazy digits =
  let max_num, min_num = compute_bounds digits in

  (* Генерируем последовательность пар (i, j) *)
  let rec pairs_seq i j () =
    if i < min_num then Seq.Nil
    else if j < i then pairs_seq (i - 1) max_num ()
    else Seq.Cons ((i, j), pairs_seq i (j - 1))
  in

  pairs_seq max_num max_num
  |> Seq.map (fun (i, j) -> i * j)
  |> Seq.filter is_palindrome |> Seq.fold_left max 0
