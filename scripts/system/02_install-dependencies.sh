#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

ENABLED_PACKAGES=$(cat "$SCRIPT_DIR/dependencies_optional.txt" | gum choose --no-limit --header "optional features")

# system packages
pacman -Sy flatpak ripgrep
if grep -q "docker" <<< "$ENABLED_PACKAGES"; then
  pacman -Sy docker
fi

# app dependencies
pacman -Sy python python-poetry npm pnpm
if grep -q "pipx" <<< "$ENABLED_PACKAGES"; then
  pacman -Sy pipx
fi

# install OBS
pacman -Sy obs-studio
# if gum confirm "install the non flatpak OBS Studio version?"; then
#   pacman -Sy obs-studio
# else
#   flatpak install flathub com.obsproject.Studio
# fi
