open Alcotest
open Task4_palindrome.Utils
open Task4_palindrome.Task4_recursion
open Task4_palindrome.Task4_fold
open Task4_palindrome.Task4_map
open Task4_palindrome.Task4_lazy
open Task4_palindrome.Task4_imperative

(* Тест для проверки функции is_palindrome *)
let test_is_palindrome () =
  check bool "9009 is palindrome" true (is_palindrome 9009);
  check bool "9119 is palindrome" true (is_palindrome 9119);
  check bool "1234 is not palindrome" false (is_palindrome 1234);
  check bool "1 is palindrome" true (is_palindrome 1)

(* Тест для хвостовой рекурсии *)
let test_palindrome_tail_rec () =
  check int "Largest palindrome for 2-digit" 9009
    (largest_palindrome_tail_rec 2);
  check int "Largest palindrome for 3-digit" 906609
    (largest_palindrome_tail_rec 3)

(* Тест для обычной рекурсии *)
let test_palindrome_rec () =
  check int "Largest palindrome for 2-digit" 9009 (largest_palindrome_rec 2);
  check int "Largest palindrome for 3-digit" 906609 (largest_palindrome_rec 3)

(* Тест для модульной реализации с fold *)
let test_palindrome_fold () =
  check int "Largest palindrome for 2-digit" 9009 (largest_palindrome_fold 2);
  check int "Largest palindrome for 3-digit" 906609 (largest_palindrome_fold 3)

(* Тест для реализации с map *)
let test_palindrome_map () =
  check int "Largest palindrome for 2-digit" 9009 (largest_palindrome_map 2);
  check int "Largest palindrome for 3-digit" 906609 (largest_palindrome_map 3)

(* Тест для реализации с ленивыми последовательностями *)
let test_palindrome_lazy () =
  check int "Largest palindrome for 2-digit" 9009 (largest_palindrome_lazy 2);
  check int "Largest palindrome for 3-digit" 906609 (largest_palindrome_lazy 3)

(* Тест для императивной реализации *)
let test_palindrome_imperative () =
  check int "Largest palindrome for 2-digit" 9009
    (largest_palindrome_imperative 2);
  check int "Largest palindrome for 3-digit" 906609
    (largest_palindrome_imperative 3)

let () =
  let open Alcotest in
  run "task4"
    [
      ( "is_palindrome",
        [ test_case "Check palindrome detection" `Quick test_is_palindrome ] );
      ( "palindrome_tail_rec",
        [
          test_case "Largest palindrome - tail recursion" `Quick
            test_palindrome_tail_rec;
        ] );
      ( "palindrome_rec",
        [
          test_case "Largest palindrome - recursion" `Quick test_palindrome_rec;
        ] );
      ( "palindrome_fold",
        [ test_case "Largest palindrome - fold" `Quick test_palindrome_fold ] );
      ( "palindrome_map",
        [ test_case "Largest palindrome - map" `Quick test_palindrome_map ] );
      ( "palindrome_lazy",
        [
          test_case "Largest palindrome - lazy seq" `Quick test_palindrome_lazy;
        ] );
      ( "palindrome_imperative",
        [
          test_case "Largest palindrome - imperative" `Quick
            test_palindrome_imperative;
        ] );
    ]
