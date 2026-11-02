#!/usr/bin/env bash
set -euo pipefail

run-parts --regex '.sh$' "$SCRIPT_DIR/system"
