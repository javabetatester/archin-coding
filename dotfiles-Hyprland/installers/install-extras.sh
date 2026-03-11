#!/bin/bash
DESC="Thunar, KDE Connect, gpu-screen-recorder, Nerd Font"
set -e
sudo pacman -S --needed thunar kdeconnect ttf-jetbrains-mono-nerd
if command -v yay &>/dev/null; then
  yay -S --needed gpu-screen-recorder
elif command -v paru &>/dev/null; then
  paru -S --needed gpu-screen-recorder
else
  echo "[AVISO] Nenhum helper AUR. Pule: gpu-screen-recorder"
fi
