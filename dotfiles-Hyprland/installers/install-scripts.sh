#!/bin/bash
DESC="random-wallpaper, define, Music"
set -e
sudo pacman -S --needed grim slurp imagemagick jq curl wl-clipboard
[[ -e ~/.config/scripts ]] && mv ~/.config/scripts "$BACKUP_DIR/"
cp -r "$REPO/.config/scripts" ~/.config/
chmod +x ~/.config/scripts/* 2>/dev/null || true
