#!/usr/bin/env bash
set -euo pipefail

# TODO: ask user for optional input for username
USERNAME="kiosk"
HOME_DIR="/home/$USERNAME"

# create user
useradd -m "$USERNAME"
passwd "$USERNAME"

# give cloned folder correct permissions
sudo groupadd shared
sudo chgrp shared "$ROOT_DIR"
sudo chmod 2770 "$ROOT_DIR"
sudo usermod -a -G shared "$USERNAME"

# setup initial directory and aliases for interactive shells
ln -s "$ROOT_DIR" "/home/$USERNAME/windscope"
echo "alias home=$ROOT_DIR"
echo "cd ~/windscope" > "$HOME_DIR/.bashrc"
