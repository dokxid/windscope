#!/usr/bin/env bash
set -euo pipefail

# docs https://python-poetry.org/docs/basic-usage/
cd "$SCANNER_DIR"
poetry install
