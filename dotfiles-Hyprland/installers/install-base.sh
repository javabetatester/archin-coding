#!/bin/bash
DESC="NetworkManager, Bluetooth, WirePlumber, brightness, playerctl"
set -e
sudo pacman -S --needed networkmanager bluez bluez-utils wireplumber alsa-utils brightnessctl playerctl
sudo systemctl enable --now NetworkManager 2>/dev/null || true
sudo systemctl enable --now bluetooth 2>/dev/null || true
