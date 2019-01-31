(* Test value injection *)
[%%define x "testing 1 2 3"]
[%%inject "x", x]
[%%inject "y", 123]
[%%inject "z", "123"]
[%%inject "b", false]

[%%if x = "apples"]
[%%inject "k", k]
[%%else]
let k = "apples"
[%%endif]

let%expect_test "injection" =
  print_endline x;
  print_endline (string_of_int y);
  print_endline z;
  if b then print_endline "y" else print_endline "n";
  print_endline k;
  [%expect{|
testing 1 2 3
123
123
n
apples
  |}]
