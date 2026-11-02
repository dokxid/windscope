#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
ROOT_DIR="$SCRIPT_DIR/../.."

# docs https://python-poetry.org/docs/basic-usage/
cd "$ROOT_DIR/scanner"
poetry install
