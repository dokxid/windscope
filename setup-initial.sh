#!/usr/bin/env bash
set -euo pipefail

if ! [ -x "$(command -v pacman)" ]; then
  echo 'ERROR: non arch linux systems not supported yet.' >&2
  exit 1
fi

# this prints out a --list instead rn, due to not wanting to invoke this executable while developing accidentally
# TODO: make user select, which ones to run using gum
run-parts --list -v --regex '^[[:digit:]][[:digit:]]_.*.sh$' "$ROOT_DIR/scripts"
