#!/bin/bash
DOT="$HOME/.dotfiles"

log ()
{
  echo "====================[$1 Configuration]===================="
}

install_dep()
{
  log "Dependecy"
  sudo apt-get update
  sudo add-apt-repository ppa:git-core/ppa
  sudo add-apt-repository ppa:openjdk-r/ppa

  sudo apt-get update && sudo apt-get upgrade

  sudo apt install -y zsh gdb binutils curl tmux gcc valgrind g++ make python3 python3-pip zip unzip python3-venv shellcheck openjdk-19-jdk openjdk-19-source
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

  mkdir -p ~/.config   
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
  install_dep
  conf_ln
  conf_nvm
}

main
