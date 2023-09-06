#!/bin/bash
DOT="/home/cornel/.dotfiles"

log ()
{
  echo "====================[$1 Configuration]===================="
}

conf_ln ()
{
  ln_if ()
  {
    if [ -e "$2" ] || [ -L "$2" ]; then
      echo "[Deleted] $2"
      rm -rf "$2" 
    fi
    
    ln -s "$1" "$2" 
    echo "[Created] Symbolic Link to $2"
  }

  log "Links"
  # ZSH config
  ln_if "$DOT/zsh/init.zsh" ~/.zshrc
  ln_if "$DOT/zsh/env.zsh" ~/.zshenv

  # MODULES
  ln_if "$DOT/modules/nvm" ~/.nvm
  ln_if "$DOT/modules/nvim" ~/.config/nvim
  ln_if "$DOT/nvim" "$DOT/modules/nvim/lua/custom"
  ln_if "$DOT/i3" ~/.config/i3
  ln_if "$DOT/tmux" ~/.config/tmux
}

conf_nvm ()
{
  log "NVM"
  source "$DOT/zsh/functions.zsh"
  nvm_lts
}

main ()
{
  conf_ln
  conf_nvm
}

main
