#!/usr/bin/env bash
set -euo pipefail

GREEN='\033[0;32m'
RED='\033[0;31m'
RESET='\033[0m'

# check if obs (non flatpak) is installed
if command -v obs >/dev/null 2>&1; then
  printf "${GREEN}obs already installed${RESET}%s\n"
else
  printf "${RED}obs NOT FOUND${RESET}%s\n"
  echo "installing obs-studio"
  sudo pacman -Sy obs-studio
fi

# prompt user to load script
gum confirm $'manual invention required: \nyou have to load the script in \n$ROOT_DIR/vendor/obs/filter-cornerpin.lua \ninto OBS manually' --affirmative=done --negative="" --padding=1
echo "proceeding..."

# install 3d-effect obs-plugin
echo "installing 3d-effect..."
if ! test -f /home/"$(whoami)"/.config/obs-studio/plugins/3d-effect; then
  wget -O /tmp/3d-effect.zip https://obsproject.com/forum/resources/3d-effect.1692/version/6258/download?file=113472
  unzip -p /tmp/3d-effect.zip | tar -xvzf - -C /home/"$(whoami)"/.config/obs-studio/plugins
fi

# install shaderfilter obs-plugin
echo "installing shaderfilter..."
if ! test -f /home/"$(whoami)"/.config/obs-studio/plugins/obs-shaderfilter; then
  wget -O /tmp/obs-shaderfilter.tar.gz https://github.com/exeldro/obs-shaderfilter/releases/download/2.6.1/obs-shaderfilter-2.6.1-ubuntu-22.04.tar.gz
  tar -xvzf /tmp/obs-shaderfilter.tar.gz -C /home/"$(whoami)"/.config/obs-studio/plugins
fi
