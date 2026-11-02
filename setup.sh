#!/usr/bin/env bash
set -euo pipefail

if ! [ -x "$(command -v pacman)" ]; then
  echo 'ERROR: non arch linux systems not supported yet.' >&2
  exit 1
fi

# display status first
# ./scripts/check-status.sh | gum pager

# select script
SCRIPT_TO_EXECUTE=$(gum file "$SCRIPT_DIR" --padding="3" --header="choose the script to execute")
gum confirm --padding="1" && "$SCRIPT_TO_EXECUTE" || echo "exited without doing anything"

