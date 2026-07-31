#!/usr/bin/env bash


if ! pgrep -x hyprpaper >/dev/null; then
    hyprpaper &
    sleep 1
fi

# Pasta dos wallpapers
WALLPAPERS_DIR="$HOME/Imagens/Wallpapers"

# Arquivo que guarda o índice atual
INDEX_FILE="$HOME/.cache/current_wallpaper_index"

# Monitores alvo
MONITORS=("HDMI-A-1" "eDP-1")

# Cria o arquivo de índice se não existir
mkdir -p "$HOME/.cache"
[ ! -f "$INDEX_FILE" ] && echo 0 > "$INDEX_FILE"

# Lê o índice atual
CURRENT_INDEX=$(cat "$INDEX_FILE")

# Lista de wallpapers (somente imagens, ordem alfabética)
mapfile -t WALLPAPERS < <(
    find "$WALLPAPERS_DIR" -maxdepth 1 -type f \
    \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" -o -iname "*.webp" \) \
    | sort
)

TOTAL=${#WALLPAPERS[@]}
[ "$TOTAL" -eq 0 ] && exit 1

# Próximo índice
NEXT_INDEX=$(( (CURRENT_INDEX + 1) % TOTAL ))

# Wallpaper escolhido
NEW_WP="${WALLPAPERS[$NEXT_INDEX]}"

# Aplica sem reiniciar o hyprpaper
hyprctl hyprpaper preload "$NEW_WP"

for MONITOR in "${MONITORS[@]}"; do
    hyprctl hyprpaper wallpaper "$MONITOR,$NEW_WP"
done

# Atualiza índice
echo "$NEXT_INDEX" > "$INDEX_FILE"
