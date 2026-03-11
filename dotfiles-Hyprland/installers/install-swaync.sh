#!/bin/bash
DESC="Notification center"
set -e
sudo pacman -S --needed swaync
[[ -e ~/.config/swaync ]] && mv ~/.config/swaync "$BACKUP_DIR/"
cp -r "$REPO/.config/swaync" ~/.config/
