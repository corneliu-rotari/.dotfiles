#!/bin/bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

apps=(fzf zoxide eza tmux)

# Iterate over each file
for app in "${apps[@]}"; do
  brew install "$app"
done
