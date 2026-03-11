#!/bin/bash
DESC="Theme from wallpaper (swww + pywal)"
set -e
sudo pacman -S --needed python-pywal
[[ -e ~/.config/wal ]] && mv ~/.config/wal "$BACKUP_DIR/"
cp -r "$REPO/.config/wal" ~/.config/
