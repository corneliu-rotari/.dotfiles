#!/bin/bash
DOT="/home/cornel/.dotfiles"

function ln_if ()
{
  if [ -e "$2" ] || [ -L "$2" ]; then
    echo "[Deleted] $2"
    rm -rf "$2" 
  fi
  
  ln -s "$1" "$2" 
  echo "[Created] Symbolic Link to $2"
}

# ZSH config
ln_if "$DOT/zsh/init.zsh" ~/.zshrc
ln_if "$DOT/zsh/env.zsh" ~/.zshenv

# MODULES
ln_if "$DOT/modules/nvm" ~/.nvm
ln_if "$DOT/modules/nvim" ~/.config/nvim
ln_if "$DOT/nvim" "$DOT/modules/nvim/custom"
ln_if "$DOT/i3" ~/.config/i3
