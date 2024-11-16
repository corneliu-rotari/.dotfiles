#!/bin/bash
export DOT="$(dirname -- "$(realpath "$0")")"
export DOT_ZSH="$DOT/zsh"
source "$DOT/zsh/custom/plugins/personal/personal.plugin.zsh"

conf_nvm() {
  up nvm
}

wsl_config() {
  if ! check wsl; then
    return
  fi
  log "WSL"

  $PM install -y wslu # WSL specific
  ln -sf "$(wslpath "$(wslvar USERPROFILE)")" ~/windows
}

post_install() {
  ssh-keygen
  ~/.config/tmux/plugins/tpm/bin/install_plugins
}

confirm() {
    read -p "$1 [Y/n]: " resp
    if [ -z "$resp" ]; then
        response_lc="y" # empty is Yes
    else
        response_lc=$(echo "$resp" | tr '[:upper:]' '[:lower:]') # case insensitive
    fi

    [ "$response_lc" = "y" ]
}

sudo apt-get update
sudo apt-get upgrade
sudo apt install python3

files=(i_dep.py create_dir.sh brew.sh cargo.sh)

# Iterate over each file
for file in "${files[@]}"; do
    echo ""
    if [[ "$file" == *.py ]]; then
        python3 "$DOT/install/$file"
    else
        source "$DOT/install/$file"
    fi
done

# wsl_config
# conf_nvm
# post_install
