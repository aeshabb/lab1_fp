open Alcotest
open Task26_cycles.Utils
open Task26_cycles.Task26_recursion
open Task26_cycles.Task26_mix
open Task26_cycles.Task26_lazy
open Task26_cycles.Task26_map
open Task26_cycles.Task26_imperative

(* Тест для вычисления длины цикла *)
let test_cycle_length () =
  check int "1/3 has cycle length 1" 1 (cycle_length 3);
  check int "1/6 has cycle length 1" 1 (cycle_length 6);
  (* 0.1(6) - цикл "6" *)
  check int "1/7 has cycle length 6" 6 (cycle_length 7);
  check int "1/9 has cycle length 1" 1 (cycle_length 9);
  check int "1/2 has cycle length 0" 0 (cycle_length 2);
  (* 0.5 - без цикла *)
  check int "1/4 has cycle length 0" 0 (cycle_length 4)
(* 0.25 - без цикла *)

(* Тест для хвостовой рекурсии *)
let test_longest_cycle_tail_rec () =
  check int "d<10: longest cycle is for d=7" 7 (longest_cycle_tail_rec 10);
  check int "d<100: longest cycle is for d=97" 97 (longest_cycle_tail_rec 100)

(* Тест для обычной рекурсии *)
let test_longest_cycle_rec () =
  check int "d<10: longest cycle is for d=7" 7 (longest_cycle_rec_wrapper 10);
  check int "d<100: longest cycle is for d=97" 97
    (longest_cycle_rec_wrapper 100)

(* Тест для модульной реализации *)
let test_longest_cycle_modular () =
  check int "d<10: longest cycle is for d=7" 7 (longest_cycle_modular 10);
  check int "d<100: longest cycle is for d=97" 97 (longest_cycle_modular 100)

(* Тест для реализации с filter *)
let test_longest_cycle_filter () =
  check int "d<10: longest cycle is for d=7" 7 (longest_cycle_filter 10);
  check int "d<100: longest cycle is for d=97" 97 (longest_cycle_filter 100)

(* Тест для ленивой реализации *)
let test_longest_cycle_lazy () =
  check int "d<10: longest cycle is for d=7" 7 (longest_cycle_lazy 10);
  check int "d<100: longest cycle is for d=97" 97 (longest_cycle_lazy 100)

(* Тест для реализации с map *)
let test_longest_cycle_map () =
  check int "d<10: longest cycle is for d=7" 7 (longest_cycle_map 10);
  check int "d<100: longest cycle is for d=97" 97 (longest_cycle_map 100)

(* Тест для императивной реализации *)
let test_longest_cycle_imperative () =
  check int "d<10: longest cycle is for d=7" 7 (longest_cycle_imperative 10);
  check int "d<100: longest cycle is for d=97" 97 (longest_cycle_imperative 100)

let () =
  let open Alcotest in
  run "task26"
    [
      ( "cycle_length",
        [ test_case "Calculate cycle length" `Quick test_cycle_length ] );
      ( "longest_cycle_tail_rec",
        [
          test_case "Longest cycle - tail recursion" `Quick
            test_longest_cycle_tail_rec;
        ] );
      ( "longest_cycle_rec",
        [ test_case "Longest cycle - recursion" `Quick test_longest_cycle_rec ]
      );
      ( "longest_cycle_modular",
        [
          test_case "Longest cycle - modular" `Quick test_longest_cycle_modular;
        ] );
      ( "longest_cycle_filter",
        [ test_case "Longest cycle - filter" `Quick test_longest_cycle_filter ]
      );
      ( "longest_cycle_lazy",
        [ test_case "Longest cycle - lazy" `Quick test_longest_cycle_lazy ] );
      ( "longest_cycle_map",
        [ test_case "Longest cycle - map" `Quick test_longest_cycle_map ] );
      ( "longest_cycle_imperative",
        [
          test_case "Longest cycle - imperative" `Quick
            test_longest_cycle_imperative;
        ] );
    ]
