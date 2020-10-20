let () =
  Expect_test_collector.Current_file.set
    ~absolute_filename:"test/injection.ml"
let () = Ppx_inline_test_lib.Runtime.set_lib_and_partition "ppx_optcomp" ""
let (x : string) = ("testing 1 2 3" : string)
let (y : int) = (123 : int)
let (z : string) = ("123" : string)
let (b : bool) = (false : bool)
let k = "apples"
let () =
  let module Expect_test_collector =
    (Expect_test_collector.Make)(Expect_test_config) in
    Expect_test_collector.run
      ~file_digest:(Expect_test_common.Std.File.Digest.of_string
                      "090a40ad61e84b97174e63a555a84068")
      ~location:{
                  filename =
                    (Expect_test_common.Std.File.Name.of_string
                       "test/injection.ml");
                  line_number = 14;
                  line_start = 214;
                  start_pos = 214;
                  end_pos = 439
                } ~absolute_filename:"test/injection.ml"
      ~description:(Some "injection") ~tags:[]
      ~expectations:[({
                        tag = (Some "");
                        body =
                          (Pretty "\ntesting 1 2 3\n123\n123\nn\napples\n  ");
                        extid_location =
                          {
                            filename =
                              (Expect_test_common.Std.File.Name.of_string
                                 "test/injection.ml");
                            line_number = 20;
                            line_start = 390;
                            start_pos = 394;
                            end_pos = 400
                          };
                        body_location =
                          {
                            filename =
                              (Expect_test_common.Std.File.Name.of_string
                                 "test/injection.ml");
                            line_number = 20;
                            line_start = 390;
                            start_pos = 400;
                            end_pos = 438
                          }
                      } : string Expect_test_common.Std.Expectation.t)]
      ~uncaught_exn_expectation:None ~inline_test_config:(module
      Inline_test_config)
      (fun () ->
         print_endline x;
         print_endline (string_of_int y);
         print_endline z;
         if b then print_endline "y" else print_endline "n";
         print_endline k;
         Expect_test_collector.save_output
           {
             filename =
               (Expect_test_common.Std.File.Name.of_string
                  "test/injection.ml");
             line_number = 20;
             line_start = 390;
             start_pos = 394;
             end_pos = 400
           })
let () = Ppx_inline_test_lib.Runtime.unset_lib "ppx_optcomp"
let () = Expect_test_collector.Current_file.unset ()
