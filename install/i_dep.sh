#!/bin/bash

echo "Installing depedencies"
PM="sudo apt"


# sudo add-apt-repository ppa:git-core/ppa
# sudo add-apt-repository ppa:openjdk-r/ppa
# $PM installl openjdk-19-jdk openjdk-19-source


# chsh -s "$(which zsh)"

# if ! check wsl; then
#   if which brave-browser &>/dev/null; then
#     sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
#
#     echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
#
#     $PM update
#     $PM install brave-browser
#   fi
#
#   if which snap &>/dev/null; then
#     snap install spotify
#   fi
# fi
