# Locations
alias desktop="cd $HOME/Desktop || cd $HOME/desktop"
alias dot="cd $DOT"
alias dev="cd $HOME/dev"
alias docs="cd $HOME/Documents"
alias labs="cd $HOME/dev/labs"
alias projects="cd $HOME/dev/projects"
vcs() {
	cd "/home/vcs/$1" || return
}
