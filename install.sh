#!/bin/bash
DOT="$HOME/.dotfiles"

source "$DOT/zsh/functions.zsh"

create_dirs() {
	log "Directory"
	mkdir -p ~/.config
	mkdir -p "$DOT/tmux/plugins"
}

i_cargo() {
	log "Cargo"
	curl https://sh.rustup.rs -sSf | sh
	source "$HOME/.cargo/env"
	cargo install exa
	cargo install bob-nvim
}

i_dep() {
	log "Dependecy"
	sudo apt-get update && sudo apt-get upgrade
	# sudo add-apt-repository ppa:git-core/ppa
	# sudo add-apt-repository ppa:openjdk-r/ppa
	# sudo apt-get installl openjdk-19-jdk openjdk-19-source

	if check_wsl; then
		sudo apt install -y wslu # WSL specific
	else
		sudo apt install -y xclip # Linux specific
	fi

	sudo apt install -y zsh gdb binutils curl tmux gcc valgrind \
		g++ make python3 python3-pip zip unzip \
		python3-venv shellcheck ripgrep \
		software-properties-common bear figlet
	chsh -s "$(which zsh)"
}

conf_ln() {
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
	ln_if "$DOT/modules/tpm" "$DOT/tmux/plugins/tpm"

	if ! check_wsl; then
		ln_if "$(wslpath "$(wslvar USERPROFILE)")" ~/windows
	fi
}

conf_nvm() {
	log "NVM"
	source "$DOT/zsh/functions.zsh"
	nvm_lts
}

wsl_config() {
  if ! check_wsl; then
    return
  fi
}

# Main

i_dep
create_dirs
conf_ln
conf_nvm
i_cargo
clear
echo "Please restart the terminal and run after ./~.dotfiles/config.sh"
