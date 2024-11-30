export ZSH="$DOT/modules/oh-my-zsh"
export ZSH_CUSTOM="$DOT_ZSH/custom"
export ZSH_THEME="lambda"
export ZSH_THEME="fwalch"

export ZSH_WEB_SEARCH_ENGINES=(
  gist "https://gist.github.com/search?q="
)
zstyle ':omz:update' mode reminder # just remind me to update when it's time

plugins=(
  zsh-syntax-highlighting
  zsh-autosuggestions

  archlinux
  git
  web-search
  tmux
  zoxide
  brew
  fzf
  personal
  subversion
)

source_if() {
  if test -r "$1"; then
    source "$1"
  fi
}

source_if "$ZSH/oh-my-zsh.sh"
source_if "$DOT_ZSH/exit.zsh"
source_if "$HOME/.cargo/env"
source_if "$HOME/.ghcup/env"
source_if "$HOME/.local_env"


# Load Angular CLI autocompletion.
if npm list -g @angular/cli &>/dev/null; then
  source <(ng completion script)
fi
