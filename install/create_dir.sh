#!/bin/bash

mkdir -p ~/.config ~/dev ~/.tmux/plugins/

ln -sf "$DOT/zsh/init.zsh" ~/.zshrc
ln -sf "$DOT/zsh/env.zsh" ~/.zshenv

ln -sf "$DOT/fonts" ~/.fonts

ln -sf "$DOT/modules/nvm" ~/.nvm

ln -sf "$DOT/modules/nvim" ~/.config/nvim

ln -sf "$DOT/nvim" "$DOT/modules/nvim/lua/custom"

ln -sf "$DOT/i3" ~/.config/i3

ln -sf "$DOT/tmux" ~/.config/tmux
ln -sf "$DOT/modules/tpm" "$DOT/tmux/plugins/tpm"
