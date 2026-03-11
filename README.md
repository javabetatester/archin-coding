# HyprLand Config


| Component | Tool |
|-----------|------|
| **WM** | Hyprland |
| **Terminal** | Kitty |
| **Widgets** | QuickShell |
| **App Launcher** | Quickshell |
| **Lockscreen** | Hyprlock |
| **Notifications** | SwayNC |
| **Wallpapers** | swww + pywal |
| **Bar** | Quickshell |

**Super K** - Abre tutorial de keybinds

## Installation

As dotfiles estao incluídas no repo. Navegue ate a pasta e execute:

```bash
cd dotfiles-Hyprland
chmod +x install.sh
./install.sh
```

O instalador exibe um menu para escolher quais modulos instalar. Digite os numeros separados por espaco (ex: 1 3 5) ou 'a' para todos.

| Modulo | Descricao |
|--------|-----------|
| base | NetworkManager, Bluetooth, WirePlumber, audio |
| hyprland | Window manager, hyprlock, hypridle, swww |
| kitty | Terminal |
| quickshell | Bar, launcher, dashboard, music panel |
| swaync | Notification center |
| wal | Pywal (theme from wallpaper) |
| fastfetch | System info no terminal |
| cava | Audio spectrum visualizer |
| starship | Shell prompt |
| scripts | random-wallpaper, define, Music |
| rmpc | MPD client (TUI) |
| extras | Thunar, KDE Connect, gpu-screen-recorder, Nerd Font |
| wallpapers | Colecao de wallpapers |

Cada modulo tem seu script em `installers/install-<nome>.sh`. Para rodar um so: `REPO=$(pwd) BACKUP_DIR=~/.dotfiles-backup-manual ./installers/install-kitty.sh`

Comandos adicionais:
- `./install.sh deps` - instala dependencias de todos os modulos
- `./install.sh configs` - instala configs de todos os modulos (sem menu)

