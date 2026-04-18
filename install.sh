#!/bin/bash

# Check not root
if [ "$(id -u)" -eq 0 ]; then
  echo "User root not going to run it"
  exit 1
fi

#-----------------Vars--------------------------
export DOT="$(dirname -- "$(realpath "$0")")"
export DOT_ZSH="$DOT/zsh"
source "$DOT/zsh/custom/plugins/personal/personal.plugin.zsh"
FMT="%-80s"
PM="apt-get"
ARGS="install -y"
FILES=""
BREW=""

# ---------------- Start ---------------------
up "system"

mkdir -p ~/.config ~/dev
: "${XDG_CONFIG_HOME:=$HOME/.config}"

if confirm "Create sym links" ; then
  ln -sf "$DOT/zsh/init.zsh" ~/.zshrc
  ln -sf "$DOT/zsh/env.zsh" ~/.zshenv
  ln -sf "$DOT/fonts" ~/.fonts
  ln -sf "$DOT/modules/nvm" ~/.nvm

  # Create sym links for XDG_CONFIG_HOME
  for link in "$DOT/config"/*; do
    ln -sf "$link" "$XDG_CONFIG_HOME/$(basename "$link")" 
  done
fi

. /etc/os-release

case "$ID" in
  debian)
    FILES="debian.txt"
    BREW="brew.txt"
    ;;
    
  ubuntu)
    FILES="debian.txt ubuntu.txt"
    BREW="brew.txt"
    ;;

  fedora)
    PM="dnf"
    FILES="fedora.txt"
    ;;

  arch)
    PM="pacman"
    ARGS="-S --noconfirm"
    FILES="arch.txt"
    ;;

  *)
    echo "Unsupported distro: $ID" >&2
    exit 1
    ;;
esac

FILES=`printf "${DOT}/install/%s " $FILES`

# Install pkg
if confirm "Install packages"; then
  for fl in $FILES; do
    for package in `cat $fl`; do
        STATUS="FAILED"
        sudo $PM $ARGS $package > /dev/null && STATUS="OK"
        prt "Installing $package" "$STATUS"
    done
  done
fi

# WSL
if check wsl && confirm "Add the WSL PATH"; then
  sudo $PM $ARGS wslu # WSL specific
  ln -sf "$(wslpath "$(wslvar USERPROFILE)")" ~/windows
fi

# Change to zsh
if [ "$(ps -p $$ -o comm=)" != "zsh" ] && confirm "Change to Zsh"; then
  chsh -s /bin/zsh
fi

# Install brew
if [ -n "$BREW" ] && confirm "Install Brew"; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

  BREW=`printf "${DOT}/install/%s " $BREW`
  for pkg in `cat $BREW`; do
    STATUS="FAILED"
    brew install "$pkg" > /dev/null && STATUS="OK"
    prt "Installing $package" "$STATUS"
  done
fi

# install cargo
if confirm "Install Cargo"; then
  # Install cargo
  curl https://sh.rustup.rs -sSf | sh
  source "$HOME/.cargo/env"
fi

# Install brave-browser
if confirm "Install Brave"; then
  curl -fsS https://dl.brave.com/install.sh | sh
fi


# Install brave-browser
if confirm "Install Docker"; then
  curl -fsSL https://get.docker.com | sh
fi

# Add to groupd
if confirm "Add to Groups"; then
  grps=("wireshark" "kvm" "input" "wheel" "libvirt" "uucp" "docker")
  for grp in "${grps[@]}"; do
      STATUS="FAILED"
      sudo usermod -aG "$grp" "$USER" && STATUS="OK"
      prt "Adding to $grp" "$STATUS"
  done
fi

if confirm "Install node"; then
  up nvm
fi

#Cleanup
rm -rf "$HOME/.bash*"
$XDG_CONFIG_HOME/tmux/plugins/tpm/bin/install_plugins
ssh-keygen
