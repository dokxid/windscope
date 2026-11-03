#!/usr/bin/env bash
set -euo pipefail

# dont allow non arch linux for now
if ! [ -x "$(command -v pacman)" ]; then
  echo 'ERROR: non arch linux systems not supported yet.' >&2
  exit 1
fi

# install script dependencies, if not installed
if ! [ -x "$(command -v mise)" ]; then
  echo "installing mise-en-place..."
  sudo pacman -Sy mise
  mise trust
  # shellcheck disable=SC2016
  echo 'eval "$(~/.local/bin/mise activate bash)"' >> ~/.bashrc
fi
if ! [ -x "$(command -v gum)" ]; then
  echo "installing gum..."
  sudo pacman -Sy gum
fi

# display status first
./scripts/check-status.sh | gum pager

# select script
SCRIPT_TO_EXECUTE=$(gum file "$SCRIPT_DIR" --padding="3" --header="choose the script to execute")
gum confirm --padding="1" && "$SCRIPT_TO_EXECUTE" || echo "exited without doing anything"

