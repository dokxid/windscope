#!/usr/bin/env bash
set -xeuo pipefail

cd "$APP_DIR"
pnpm install --lockfile-only
