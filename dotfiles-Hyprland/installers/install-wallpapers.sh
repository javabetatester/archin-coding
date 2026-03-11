#!/bin/bash
DESC="Colecao de wallpapers (opcional)"
set -e
mkdir -p ~/wallpapers
[[ -d "$REPO/wallpapers" ]] && cp -rn "$REPO"/wallpapers/* ~/wallpapers/ 2>/dev/null || true
