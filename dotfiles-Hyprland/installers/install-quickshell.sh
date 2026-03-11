#!/bin/bash
DESC="Bar, launcher, dashboard, music panel"
set -e
if command -v yay &>/dev/null; then
  yay -S --needed quickshell-git
elif command -v paru &>/dev/null; then
  paru -S --needed quickshell-git
else
  echo "[AVISO] Nenhum helper AUR. Pule: quickshell-git"
fi
[[ -e ~/.config/quickshell ]] && mv ~/.config/quickshell "$BACKUP_DIR/"
cp -r "$REPO/.config/quickshell" ~/.config/
mkdir -p ~/.local/bin
echo '#!/bin/bash
pkill quickshell; nohup quickshell &>/dev/null &' > ~/.local/bin/start-quickshell.sh
chmod +x ~/.local/bin/start-quickshell.sh
