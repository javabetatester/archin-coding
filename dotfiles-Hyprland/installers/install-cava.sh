#!/bin/bash
DESC="Audio spectrum visualizer"
set -e
sudo pacman -S --needed cava
[[ -e ~/.config/cava ]] && mv ~/.config/cava "$BACKUP_DIR/"
cp -r "$REPO/.config/cava" ~/.config/
