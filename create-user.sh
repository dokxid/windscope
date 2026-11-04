#!/usr/bin/env bash
set -euo pipefail

# TODO: ask user for optional input for username
USERNAME="kiosk"
HOME_DIR="/home/$USERNAME"

# create user
useradd -m "$USERNAME"
passwd "$USERNAME"

# give cloned folder correct permissions
sudo mkdir /home/shared/
sudo groupadd shared
sudo chown :shared "$ROOT_DIR"
sudo chown :shared "/home/shared"
sudo chmod 2770 "$ROOT_DIR"
sudo chmod 2770 "/home/shared"
sudo usermod -a -G shared $(whoami)
sudo usermod -a -G shared "$USERNAME"

# setup initial directory and aliases for interactive shells
ln -s "$ROOT_DIR" "/home/$USERNAME/windscope"
echo "alias home=$ROOT_DIR" > "$HOME_DIR/.bashrc"
echo "cd ~/windscope" > "$HOME_DIR/.bashrc"
