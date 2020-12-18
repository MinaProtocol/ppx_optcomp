PACKAGES = {
    "base": ["v0.12.0"],
    "ocaml-compiler-libs": ["v0.11.0", ["compiler-libs.common"]],
    "ppx_expect": ["v0.12.0", ["ppx_expect.collector"]],
    "ppx_inline_test": ["v0.12.0", ["ppx_inline_test.runtime-lib"]],
    "ppxlib": ["0.8.1"],
    "stdio": ["v0.12.0"],
}

opam = struct(
    version = "2.0",
    switches = {
        "mina-0.1.0": struct(
            default  = True,
            compiler = "4.07.1",
            packages = PACKAGES
        ),
        "4.07.1": struct(
            compiler = "4.07.1",
            packages = PACKAGES
        )
    }
)
