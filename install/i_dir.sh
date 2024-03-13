#!/bin/bash

log "Directory and Links"

mkdir -p ~/.config ~/dev

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
