#!/usr/bin/env bash
set -euo pipefail

if ! [ -x "$(command -v pacman)" ]; then
  echo 'ERROR: non arch linux systems not supported yet.' >&2
  exit 1
fi

run-parts --list -v --regex '^[[:digit:]][[:digit:]]_.*.sh$' "$ROOT_DIR/scripts"
