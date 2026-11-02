#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
KDE_CONFIG_LOCATION="$XDG_CONFIG_HOME/system.kdeglobals"

# setup kiosk, see https://develop.kde.org/docs/administration/kiosk/introduction/
# TODO: setup kiosk config file in kde config
echo "kiosk setup not available yet, still needs tinkering before an exhibit"
