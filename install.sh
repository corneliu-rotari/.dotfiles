#!/bin/bash
export DOT="$HOME/.dotfiles"
export DOT_ZSH="$DOT/zsh"
export PM="sudo apt"
source "$DOT/zsh/plugins/init.zsh"

create_dirs() {
	log "Directory and Links"

	mkdir -p ~/.config ~/dev "$DOT/tmux/plugins"

	ln_if "$DOT/zsh/init.zsh" ~/.zshrc
	ln_if "$DOT/zsh/env.zsh" ~/.zshenv
	ln_if "$DOT/ssh" ~/.ssh
	ln_if "$DOT/fonts" ~/.fonts
	ln_if "$DOT/modules/nvm" ~/.nvm
	ln_if "$DOT/modules/nvim" ~/.config/nvim
	ln_if "$DOT/nvim" "$DOT/modules/nvim/lua/custom"
	ln_if "$DOT/i3" ~/.config/i3
	ln_if "$DOT/tmux" ~/.config/tmux
	ln_if "$DOT/modules/tpm" "$DOT/tmux/plugins/tpm"
}

i_cargo() {
	log "Cargo"
	curl https://sh.rustup.rs -sSf | sh
	source "$HOME/.cargo/env"
	cargo install exa
	cargo install bob-nvim
	bob install stable
	bob use stable
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

	if which brave-browser &>/dev/null; then
		sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

		echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list

		$PM update
		$PM install brave-browser
	fi

	if which snap &>/dev/null; then
		snap install spotify
	fi

	chsh -s "$(which zsh)"
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

post_install() {
  log "POST"
  ssh-keygen
	~/.config/tmux/plugins/tpm/bin/install_plugins
  nvim &
}

# Main
create_dirs
i_dep
wsl_config
conf_nvm
i_cargo
post_install
clear
echo "Restart the system and"
