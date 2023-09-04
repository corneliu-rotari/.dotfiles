typeset -U path PATH
path=(~/.local/bin $path)
path=(~/.local/share/bob/nvim-bin $path)
path=(~/.local/share/coursier/bin $path)
export PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
