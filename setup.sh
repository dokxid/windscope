#!/usr/bin/env bash
set -euo pipefail

if ! [ -x "$(command -v pacman)" ]; then
  echo 'ERROR: non arch linux systems not supported yet.' >&2
  exit 1
fi

./scripts/check-status.sh | gum pager

SCRIPT_TO_EXECUTE=$(run-parts --list -v --regex '^[[:digit:]][[:digit:]]_.*.sh$' "$SCRIPT_DIR" | gum choose --header "what do you want to setup?")

gum confirm && "$SCRIPT_TO_EXECUTE" || echo "exited without doing anything"
# gum confirm && echo "$SCRIPT_TO_EXECUTE" || echo "exited without doing anything ($SCRIPT_TO_EXECUTE not executed)"

