#! /bin/sh
function quine {
  printf "%s" "$@"
  printf "\047"
  printf "%s" "$@"
  printf "\047\n"
}
quine '#! /bin/sh
function quine {
  printf "%s" "$@"
  printf "\047"
  printf "%s" "$@"
  printf "\047\n"
}
quine '
