load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository") # , "new_git_repository")

git_repository(
    name = "obazl",
    remote = "https://github.com/mobileink/obazl",
    # branch = "master",
    commit = "9981fac56bdc7e9c85d1e907453483a7685dd30f",
    shallow_since = "1593622534 -0500"
)

load("@obazl//ocaml:deps.bzl",
     "ocaml_configure_tooling",
     "ocaml_register_toolchains")

ocaml_configure_tooling()

ocaml_register_toolchains(installation="host")

