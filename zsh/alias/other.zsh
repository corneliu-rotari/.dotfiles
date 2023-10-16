alias func="functions | grep -a -G \"^[a-z].*()\""
alias apt="sudo /usr/bin/apt"
alias rr='sudo su -'
alias up_dot="cd ~/.dotfiles && git pull && cd -"
alias up="sudo apt-get update && sudo apt-get upgrade -y &&\
          up_dot && omz update && clear"

alias ls="exa --icons"
alias gef="gdb"
alias off_note_display="xrandr --output eDP --off"
