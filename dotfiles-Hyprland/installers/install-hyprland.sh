#!/bin/bash
DESC="Window manager, hyprlock, hypridle, swww"
set -e
sudo pacman -S --needed hyprland hyprlock hypridle swww
[[ -e ~/.config/hypr ]] && mv ~/.config/hypr "$BACKUP_DIR/"
cp -r "$REPO/.config/hypr" ~/.config/
