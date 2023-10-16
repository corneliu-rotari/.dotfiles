export ZSH="$DOT/modules/oh-my-zsh"
export ZSH_CUSTOM="$DOT_ZSH/custom"
export ZSH_THEME="lambda"
zstyle ':omz:update' mode reminder # just remind me to update when it's time

plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
  zsh-vi-mode
)

source_if() {
	if test -r "$1"; then
		source "$1"
  else
    echo "$1 does not exist"
	fi
}

source_if "$ZSH/oh-my-zsh.sh"
source_if "$DOT_ZSH/alias/init.zsh"
source_if "$DOT_ZSH/function/init.zsh"
source_if "$DOT_ZSH/exit.zsh"
source_if "$HOME/.cargo/env"
source_if "$HOME/.ghcup/env"


trap 'exit_handler' EXIT SIGTERM
