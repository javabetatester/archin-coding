#!/bin/bash

set -e

REPO="$(cd "$(dirname "$0")" && pwd)"
cd "$REPO"

[[ ! -f /etc/arch-release ]] && { echo "Este instalador requer Arch Linux"; exit 1; }
[[ ! -d .config ]] && { echo "Diretorio .config nao encontrado"; exit 1; }

INSTALLERS_DIR="$REPO/installers"
BACKUP_DIR=~/.dotfiles-backup-$(date +%s)

export REPO
export BACKUP_DIR

available_installers() {
  for f in "$INSTALLERS_DIR"/install-*.sh; do
    [[ -f "$f" ]] || continue
    basename "$f" .sh | sed 's/^install-//'
  done | sort
}

get_desc() {
  local name="$1"
  local f="$INSTALLERS_DIR/install-${name}.sh"
  [[ -f "$f" ]] || return
  DESC=""
  source <(grep -m1 '^DESC=' "$f")
  echo "$DESC"
}

run_installer() {
  local name="$1"
  local f="$INSTALLERS_DIR/install-${name}.sh"
  [[ -f "$f" ]] || return
  bash "$f"
}

show_menu() {
  local installers
  readarray -t installers < <(available_installers)
  echo "=== Dotfiles Hyprland - Selecione os modulos ===" >&2
  echo "" >&2
  for i in "${!installers[@]}"; do
    local name="${installers[$i]}"
    local desc; desc=$(get_desc "$name")
    printf "  %2d) %-12s - %s\n" $((i+1)) "$name" "$desc" >&2
  done
  echo "" >&2
  echo "  a) Todos" >&2
  echo "  0) Sair" >&2
  echo "" >&2
  printf "Digite os numeros separados por espaco (ex: 1 3 5): " >&2
  read -r input
  [[ -z "$input" ]] && { echo "CANCEL" >&2; return 1; }
  [[ "$input" == "0" ]] && { echo "CANCEL" >&2; return 1; }
  local selected=()
  if [[ "$input" == "a" || "$input" == "A" ]]; then
    selected=("${installers[@]}")
  else
    for num in $input; do
      [[ "$num" =~ ^[0-9]+$ ]] || continue
      ((idx=num-1))
      [[ $idx -ge 0 && $idx -lt ${#installers[@]} ]] && selected+=("${installers[$idx]}")
    done
  fi
  if [[ ${#selected[@]} -eq 0 ]]; then
    echo "Nenhum modulo valido selecionado" >&2
    return 1
  fi
  echo "${selected[@]}"
}

install_selected() {
  local names=("$@")
  mkdir -p "$BACKUP_DIR"
  mkdir -p ~/.config ~/wallpapers
  echo "Backup em: $BACKUP_DIR"
  for name in "${names[@]}"; do
    echo ">>> Instalando: $name"
    run_installer "$name"
  done
  echo ""
  echo "Concluido. Faca logout e login novamente."
  if [[ " ${names[*]} " == *" wal "* ]] && [[ " ${names[*]} " == *" scripts "* ]]; then
    echo "Para aplicar wallpaper aleatorio: ~/.config/scripts/random-wallpaper.sh"
  fi
}

case "${1:-}" in
  deps)
    for name in $(available_installers); do
      echo ">>> Instalando dependencias: $name"
      run_installer "$name"
    done
    echo "Dependencias instaladas"
    ;;
  configs)
    mkdir -p "$BACKUP_DIR" ~/.config ~/wallpapers
    for name in $(available_installers); do
      echo ">>> Copiando configs: $name"
      run_installer "$name"
    done
    echo "Configs instaladas. Faca logout e login."
    ;;
  *)
    line=$(show_menu) || exit 0
    names=($line)
    install_selected "${names[@]}"
    ;;
esac
