#!/bin/bash
DESC="System info on terminal"
set -e
sudo pacman -S --needed fastfetch
[[ -e ~/.config/fastfetch ]] && mv ~/.config/fastfetch "$BACKUP_DIR/"
cp -r "$REPO/.config/fastfetch" ~/.config/
