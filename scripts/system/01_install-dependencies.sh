#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

if ! [ -x "$(command -v pacman)" ]; then
  echo 'ERROR: non arch linux systems not supported yet.' >&2
  exit 1
fi

# script helpers
pacman -Sy gum

ENABLED_PACKAGES=$(cat "$SCRIPT_DIR/dependencies_optional.txt" | gum choose --no-limit --header "optional features")

# system packages
pacman -Sy flatpak ripgrep
if grep -q "docker" <<< "$ENABLED_PACKAGES"; then
  pacman -Sy docker
fi

# app dependencies
pacman -Sy python python-poetry npm
if grep -q "pipx" <<< "$ENABLED_PACKAGES"; then
  pacman -Sy pipx
fi

# install OBS
if gum confirm "install the non flatpak OBS Studio version? (not recommended)" --affirmative="no" --negative="i know what i'm doing"; then
  pacman -Sy obs-studio
else
  flatpak install flathub com.obsproject.Studio
fi
