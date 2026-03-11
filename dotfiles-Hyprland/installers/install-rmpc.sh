#!/bin/bash
DESC="MPD client (TUI)"
set -e
sudo pacman -S --needed mpd
if command -v yay &>/dev/null; then
  yay -S --needed rmpc mpd-mpris
elif command -v paru &>/dev/null; then
  paru -S --needed rmpc mpd-mpris
else
  echo "[AVISO] Nenhum helper AUR. Pule: rmpc mpd-mpris"
fi
[[ -e ~/.config/rmpc ]] && mv ~/.config/rmpc "$BACKUP_DIR/"
cp -r "$REPO/.config/rmpc" ~/.config/
