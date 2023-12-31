#!/bin/bash
export DOT="$HOME/.dotfiles"
export DOT_ZSH="$DOT/zsh"
export PM="sudo apt"
source "$DOT/zsh/plugins/init.zsh"

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
	$PM update && $PM upgrade
	# sudo add-apt-repository ppa:git-core/ppa
	# sudo add-apt-repository ppa:openjdk-r/ppa
	# $PM installl openjdk-19-jdk openjdk-19-source

	if ! check wsl; then
		$PM install -y xclip # Linux specific
	fi

	$PM install -y zsh gdb binutils curl tmux gcc valgrind \
		g++ make python3 python3-pip zip unzip \
		python3-venv shellcheck software-properties-common \
		bear figlet ripgrep hping3 wireshark

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
	ln_if "$DOT/fonts" ~/.fonts
}

conf_nvm() {
	log "NVM"
	up nvm
}

wsl_config() {
	if ! check wsl; then
		return
	fi
  log "WSL"

	$PM install -y wslu # WSL specific
	ln_if "$(wslpath "$(wslvar USERPROFILE)")" ~/windows
}

# Main
i_dep
create_dirs
wsl_config
conf_ln
conf_nvm
i_cargo
clear
echo "Please restart the terminal and run after ./~.dotfiles/config.sh"
