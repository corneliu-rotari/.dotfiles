alias apt="sudo /usr/bin/apt"
alias rr='sudo su -'
alias old_ls="/usr/bin/ls"
alias up_dot="cd ~/.dotfiles && git pull && cd -"
alias up="sudo apt-get update && sudo apt-get upgrade -y &&\
          up_dot && omz update && clear"

alias clear_vim_swap="rm -rf ~/.local/state/nvim/swap/*"
alias clar="clear"
alias clera="clear"
alias clrea="clear"

alias ls="exa --icons"
alias vim="nvim"
alias edit="vim ~/.dotfiles/"
alias gef="gdb"

alias ssq="svn status -q"
alias su="svn up"
alias sci="svn ci"
alias save_gnome="dconf dump / > $DOT/utils/gnome.conf"
alias load_gnome="dconf load / < $DOT/utils/gnome.conf"
