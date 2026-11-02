#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

if ! [ -x "$(command -v pacman)" ]; then
  echo 'ERROR: non arch linux systems not supported yet.' >&2
  exit 1
fi

# script helpers
pacman -Sy gum mise

# setup mise
mise trust
# shellcheck disable=SC2016
echo 'eval "$(~/.local/bin/mise activate bash)"' >> ~/.bashrc
