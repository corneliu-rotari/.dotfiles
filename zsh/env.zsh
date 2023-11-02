typeset -U path PATH
path=("$HOME/.local/bin" $path)
path=("$HOME/.local/share/bob/nvim-bin" $path)
path=("$HOME/.local/share/coursier/bin" $path)
path=("$HOME/.dotfiles/bin" $path)
path=("$HOME/.dotfiles/lib" $path)
export PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

export DOT="$HOME/.dotfiles"
export DOT_ZSH="$DOT/zsh"
export EDITOR="nvim"

if [ -d /home/linuxbrew ]; then
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi
