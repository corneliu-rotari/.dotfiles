alias sst="svn status"
alias sup="svn up"
alias ssw="svn sw"
alias si="svn info"
alias srmu="svn cleanup --remove-unversioned"

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
