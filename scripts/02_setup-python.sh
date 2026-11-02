#!/usr/bin/env bash
set -xeuo pipefail

# docs https://python-poetry.org/docs/basic-usage/
cd "$SCANNER_DIR"
poetry install
