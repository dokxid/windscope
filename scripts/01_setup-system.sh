#!/usr/bin/env bash
set -euo pipefail

# run-parts --list --regex '.sh$' "$SCRIPT_DIR/system"

# select script
SCRIPT_TO_EXECUTE=$(gum file "$SCRIPT_DIR/system" --header "what do you want to setup?" --padding="3" --header="choose the script to execute")
gum confirm --padding="1" && "$SCRIPT_TO_EXECUTE" || echo "exited without doing anything"
