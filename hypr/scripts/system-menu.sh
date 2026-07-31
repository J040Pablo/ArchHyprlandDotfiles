#!/bin/bash

choice=$(printf "󰸉  Wallpaper\n󰌢  Monitor Notebook\n󰖀  Volume\n󰃠  Brilho\n󰋊  Bluetooth\n󰖩  Wi-Fi\n  Bloquear\n󰐥  Energia" | \
wofi --dmenu --prompt "Sistema")

case "$choice" in

"󰸉  Wallpaper")
    ~/.config/hypr/scripts/Wallpapers.sh
    ;;

"󰌢  Monitor Notebook")
    ~/.config/hypr/scripts/toggle-laptop-screen.sh
    ;;

"󰖀  Volume")
    pavucontrol
    ;;

"󰃠  Brilho")
    kitty -e brightnessctl
    ;;

"󰋊  Bluetooth")
    blueman-manager
    ;;

"󰖩  Wi-Fi")
    nm-connection-editor
    ;;

"  Bloquear")
    hyprlock
    ;;

"󰐥  Energia")
    nwg-bar
    ;;

esac