# HyprLand Config

| Componente | Ferramenta |
|------------|------------|
| WM | Hyprland |
| Terminal | Kitty |
| Bar / Launcher | QuickShell |
| Lockscreen | Hyprlock |
| Notificacoes | SwayNC |
| Wallpapers | swww + pywal |

---

## Como instalar

Requer Arch Linux. As dotfiles estao no repo.

```bash
cd dotfiles-Hyprland
chmod +x install.sh
./install.sh
```

O instalador exibe um menu. Digite os numeros separados por espaco (ex: `1 3 5`) ou `a` para instalar todos.

| Num | Modulo | Descricao |
|-----|--------|-----------|
| 1 | base | NetworkManager, Bluetooth, audio |
| 2 | hyprland | WM, hyprlock, swww |
| 3 | kitty | Terminal |
| 4 | quickshell | Bar, launcher, dashboard |
| 5 | swaync | Notificacoes |
| 6 | wal | Theme do wallpaper |
| 7 | fastfetch | Info do sistema |
| 8 | cava | Visualizador de audio |
| 9 | starship | Prompt |
| 10 | scripts | Wallpaper aleatorio, define, Music |
| 11 | rmpc | MPD client |
| 12 | extras | Thunar, KDE Connect, gravar tela, fontes |
| 13 | wallpapers | Colecao de wallpapers |

Comandos extras:
- `./install.sh deps` - apenas dependencias
- `./install.sh configs` - apenas configs (sem menu)

Depois: faca logout e login. Se instalou wal + scripts: `~/.config/scripts/random-wallpaper.sh`

---

## Como usar

Super = tecla Windows

**Super + K** - Abre o tutorial completo de atalhos no terminal

### Principais atalhos

| Teclas | Acao |
|--------|------|
| Super + Enter | Terminal |
| Super + D | Launcher (abrir app) |
| Super + E | Thunar (arquivos) |
| Super + A | Dashboard |
| Super + M | Music |
| Super + X | Travar tela |
| Super + setas | Mover foco |
| Super + Shift + setas | Mover janela |
| Super + 1 a 5 | Workspace |
| Print | Screenshot |
| F1 / F2 / F3 | Audio (mute, - , +) |

Tutorial detalhado: `~/.config/hypr/KEYBINDS.md` ou pressione **Super + K**
