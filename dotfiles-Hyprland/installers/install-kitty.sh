#!/bin/bash
DESC="Terminal emulator"
set -e
sudo pacman -S --needed kitty
[[ -e ~/.config/kitty ]] && mv ~/.config/kitty "$BACKUP_DIR/"
cp -r "$REPO/.config/kitty" ~/.config/
