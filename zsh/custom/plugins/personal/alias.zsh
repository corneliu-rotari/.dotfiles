# Terminal
alias time="=time -p"
alias ls="exa --icons --classify --oneline"
alias l='ls'
alias ll='ls -lh'
alias lll='ls -lah'
alias rr='sudo su -'
alias func="functions | grep -a -G \"^[a-z].*()\""
alias cp="\cp -v"

# Apps
alias brave="brave-browser"
alias intellij="intellij-idea-ultimate . &> /dev/null &"
alias apt="sudo /usr/bin/apt"
alias rtmux='ln -sf $(find ~/.local/share/tmux/resurrect -type f -name "*.txt" | fzf) ~/.local/share/tmux/resurrect/last; tmux'

# VIM
alias vim="nvim"
alias edit="vim ~/.dotfiles/"
alias clear_vim_swap="rm -rf ~/.local/state/nvim/swap/*"

# System
alias off_note_display="xrandr --output eDP --off"

