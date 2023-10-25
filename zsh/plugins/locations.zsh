# Locations
alias desktop="cd $HOME/Desktop || cd $HOME/desktop"
alias dot="cd $DOT"
alias dev="cd $HOME/dev"

vcs() {
	cd "/home/vcs/$1" || return
}
