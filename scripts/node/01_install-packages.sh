#!/usr/bin/env bash
set -euo pipefail

cd "$APP_DIR"
pnpm install --lockfile-only
pnpm install --global http-server
