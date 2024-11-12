# Terminal
alias time="=time -p"
alias ls="eza --icons=always --classify=always --oneline || \ls"
alias l="eza --icons=always --classify=always --oneline || \ls"
alias ll='eza --icons=always --classify=always --oneline -lh || \ls -lh'
alias lll='eza --icons=always --classify=always --oneline -lah || \ls -altr'
alias k="clear"
alias kl="k && ll"
alias rr='sudo su -'
alias func="functions | grep -a -G \"^[a-z].*()\""
alias cd="z"
alias cp="\cp -v"
alias ln="\ln -v"
alias rm="\rm -v"
alias c="cargo"

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

