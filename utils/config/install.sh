#!/bin/bash
cd
mkdir -p ~/.config

# install dependencies configuration
sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt install -y git zsh gdb binutils curl tmux gcc valgrind g++ make python3 python3-pip zip unzip

# Install Java
sudo apt update
sudo add-apt-repository ppa:openjdk-r/ppa
sudo apt install openjdk-19-jdk
sudo apt install openjdk-19-source
JAVA_HOME=$(dirname $(dirname $(readlink -f $(which java))))
sudo zsh -c "echo 'JAVA_HOME=$JAVA_HOME' >> /etc/environment"
source /etc/environment

# Install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source ~/.cargo/env

# Install Neovim version manager and Neovim
cargo install bob-nvim
bob install stable
bob use stable
export PATH="~/.local/share/bob/nvim-bin:$PATH"

echo "Done"

# # Installing Nerd Fonts
# bash -c "$(curl -fsSL https://gef.blah.cat/sh)"
# echo "\n\n"
# read -p "Installed nerd_fonts [yes/no] : " nerd_fonts

# if [ $nerd_fonts = "no" ]; then
#   echo "\nPlease install at https://www.nerdfonts.com/"
#   read done
# fi

# # Install oh-my-zsh and plugins
# "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" | bash
# # Import profile
# cp .zshrc ~
# cp -r oh-my-zsh ~/.config
# cd $ZSH_CUSTOM/plugins && git clone https://github.com/zsh-users/zsh-autosuggestions && git clone https://github.com/zsh-users/zsh-syntax-highlighting
# source ~/.zshrc

# # Install Node Version Manager 
# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | zsh

# # Install LunarVim
# zsh <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
# cp -r lvim ~/.config

# # Install Scala
# curl -fL https://github.com/coursier/launchers/raw/master/cs-x86_64-pc-linux.gz | gzip -d > cs && chmod +x cs && ./cs setup
# sudo snap install intellij-idea-ultimate --classic

