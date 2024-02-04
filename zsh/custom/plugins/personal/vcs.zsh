# Version Control
alias git_pull_dirty="git stash push && git pull && git stash pop"

svn_all() {
	clear
	for D in $(find /home/vcs/ -maxdepth 1 -type d); do
		if [ "$D" != "/home/vcs/" ] && [ "$D" != "/home/vcs/test_ground" ]; then
			echo "$D"
			svn $@ $D
			echo
		fi
	done
}
