open Utils

(* Хвостовая рекурсия - поиск числа с наибольшей длиной цикла *)
let longest_cycle_tail_rec limit =
  let rec find_max d max_d max_len =
    if d >= limit then max_d
    else
      let len = cycle_length d in
      if len > max_len then find_max (d + 1) d len
      else find_max (d + 1) max_d max_len
  in
  find_max 2 0 0

(* Обычная рекурсия *)
let rec longest_cycle_rec d limit =
  if d >= limit then (0, 0)
  else
    let current_len = cycle_length d in
    let rest_d, rest_len = longest_cycle_rec (d + 1) limit in
    if current_len > rest_len then (d, current_len) else (rest_d, rest_len)

let longest_cycle_rec_wrapper limit =
  let d, _ = longest_cycle_rec 2 limit in
  d
