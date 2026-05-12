#!/usr/bin/env bash

set -e

cd "$(dirname "$0")"

echo "[1/5] Installing pacman packages..."

if [ -f packages/pacman.txt ]; then
    sudo pacman -Syu --needed - < packages/pacman.txt
fi

echo "[2/5] Installing AUR packages..."

if command -v yay >/dev/null 2>&1 && [ -f packages/aur.txt ]; then
    yay -S --needed - < packages/aur.txt
else
    echo "yay not found or packages/aur.txt missing. Skipping AUR packages."
fi

echo "[3/5] Backing up old configs..."

backup_dir="$HOME/.dotfiles-backup-$(date +%Y%m%d-%H%M%S)"
mkdir -p "$backup_dir"
mkdir -p "$HOME/.config"

for pkg in hypr waybar wofi kitty wlogout swaync waypaper gtk nwg-look xsettingsd fastfetch fish networkmanager-dmenu thunar desktop wallpapers; do
    [ -d "$pkg/.config" ] || continue

    find "$pkg/.config" -mindepth 1 -maxdepth 1 | while read -r item; do
        name="$(basename "$item")"
        target="$HOME/.config/$name"

        if [ -e "$target" ] && [ ! -L "$target" ]; then
            echo "Backing up ~/.config/$name"
            mv "$target" "$backup_dir/"
        fi
    done
done

echo "[4/5] Stowing configs..."

for pkg in hypr waybar wofi kitty wlogout swaync waypaper gtk nwg-look xsettingsd fastfetch fish networkmanager-dmenu thunar desktop wallpapers; do
    if [ -d "$pkg" ]; then
        stow -v -t "$HOME" "$pkg"
    fi
done

echo "[5/5] Done."

echo
echo "Backup created at: $backup_dir"
echo "Now reboot or run:"
echo "hyprctl reload"
