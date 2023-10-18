# Locations
alias desktop="cd $HOME/Desktop || cd $HOME/desktop"
alias dot="cd $DOT"

vcs() {
	cd "/home/vcs/$1" || return
}
