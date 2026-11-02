#!/usr/bin/env bash
set -euo pipefail

# TODO: ask user for optional input for username
USERNAME="kiosk"
HOME_DIR="/home/$USERNAME"

# create user
useradd -m "$USERNAME"
passwd "$USERNAME"

# setup aliases
echo "alias home=$ROOT_DIR"

# setup initial directory for interactive shells
echo "cd $ROOT_DIR" > "$HOME_DIR/.bashrc"
