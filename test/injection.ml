(* Test value injection *)
[%%define x "testing 1 2 3"]
[%%inject "x", x]
[%%inject "y", 123]
[%%inject "z", "123"]
[%%inject "b", false]

let%expect_test "injection" =
  print_endline x;
  print_endline (string_of_int y);
  print_endline z;
  if b then print_endline "y" else print_endline "n";
  [%expect{|
testing 1 2 3
123
123
n
  |}]
