#!/bin/bash
export DOT="$(dirname -- "$(realpath "$0")")"
export DOT_ZSH="$DOT/zsh"
export PM="sudo apt"
source "$DOT/zsh/custom/plugins/personal/personal.plugin.zsh"


create_dirs
i_dep
wsl_config
conf_nvm
i_cargo
