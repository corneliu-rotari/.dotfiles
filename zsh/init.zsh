export ZSH="$DOT/modules/oh-my-zsh"
ZSH_CONFIG="$DOT/zsh"
export ZSH_CUSTOM="$ZSH_CONFIG/custom"

export ZSH_THEME="lambda"
zstyle ':omz:update' mode reminder # just remind me to update when it's time

plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
)

source_if_exists() {
	if test -r "$1"; then
		source "$1"
	fi
}

source_if_exists "$ZSH/oh-my-zsh.sh"

source_if_exists "$ZSH_CONFIG/aliases.zsh"
source_if_exists "$ZSH_CONFIG/functions.zsh"
source_if_exists "$HOME/.cargo/env"
source_if_exists "$HOME/.ghcup/env"
