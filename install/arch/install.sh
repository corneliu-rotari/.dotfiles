#!/bin/bash

if [[ $UID -eq 0 ]]; then
  echo "User root not going to run it"
  exit 1
fi

DOTFILES="$HOME/.dotfiles"

packages=($(cat ~/.dotfiles/install/arch/packages.txt))

for package in "${packages[@]}"; do
    printf "%-70s [OK]\n" "Installing $package"
    sudo pacman -S --needed "$package"
done

# Create sym links for XDG_CONFIG_HOME
if [[ -n $XDG_CONFIG_HOME ]]; then
  for link in "$DOTFILES/config"/*; do
    printf "%-70s [OK]\n" "Created link $link"
    ln -sf "$link" "$XDG_CONFIG_HOME/$(basename "$link")" 
  done
fi
