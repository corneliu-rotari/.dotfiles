#!/bin/bash
DOT="$HOME/.dotfiles"

log() {
	clear
	echo "====================[$1 Configuration]===================="
}

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

	sudo apt install -y zsh gdb binutils curl tmux gcc valgrind \
		g++ make python3 python3-pip zip unzip \
		python3-venv shellcheck ripgrep \
		software-properties-common xclip bear
	chsh -s "$(which zsh)"
}

conf_ln() {
	log "Links"

	ln_if() {
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
	ln_if "$DOT/nvim" "$DOT/modules/nvim/lua/custom"
	ln_if "$DOT/i3" ~/.config/i3
	ln_if "$DOT/tmux" ~/.config/tmux
	ln_if "$DOT/modules/tpm" "$DOT/tmux/plugins/tpm"
}

conf_nvm() {
	log "NVM"
	source "$DOT/zsh/functions.zsh"
	nvm_lts
}

# Main

i_dep
create_dirs
conf_ln
conf_nvm
i_cargo
clear
echo "Please restart the terminal and run after ./~.dotfiles/config.sh"
