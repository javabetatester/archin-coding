#!/bin/bash
DESC="Shell prompt"
set -e
sudo pacman -S --needed starship
[[ -e ~/.config/starship.toml ]] && mv ~/.config/starship.toml "$BACKUP_DIR/"
cp "$REPO/.config/starship.toml" ~/.config/
