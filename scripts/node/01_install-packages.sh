#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
ROOT_DIR="$SCRIPT_DIR/../.."

cd "$ROOT_DIR/windpark-app/"
pnpm install --lockfile-only
pnpm install --global http-server
