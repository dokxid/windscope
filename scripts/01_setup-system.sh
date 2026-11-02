#!/usr/bin/env bash
set -euo pipefail

# run-parts --list --regex '.sh$' "$SCRIPT_DIR/system"

echo 'this would execute:'
run-parts --list --regex '.sh$' "$SCRIPT_DIR/system"
