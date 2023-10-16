
ln_if() {
	if [ -e "$2" ] || [ -L "$2" ]; then
		echo "[Deleted] $2"
		rm -rf "$2"
	fi

	ln -s "$1" "$2"
	echo "[Created] Symbolic Link to $2"
}

log() {
	clear
	line='='
	name="[$1]"
	x=$((($(tput cols) - 4) / 2))
	for i in $(seq 1 $x); do line="=${line}"; done
	padding="${line:$((${#name} / 2))}"
	printf "%s%s%s\n" $padding $name $padding
}

tree() {
	if [ $# -ne 1 ]; then
		ls --tree --level=3
	else
		ls --tree --level="$1"
	fi
}

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

vcs() {
	cd /home/vcs/ || return
	if [[ $# -eq 1 ]]; then
		cd "$1" || return
	fi
}

nvm_lts() {
	export NVM_DIR="$HOME/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
	[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

	nvm install --lts
	nvm use --lts
	if check input "Do you want to reinstall packages?"; then

		echo -n "Select a version from which to reinstall (e.g 18.13.0)"
		read -r vers
		nvm reinstall-packages "$vers"
	fi
}

scd() {
	ssh -t "$1" "cd /mnt/app/bin ; exec \$SHELL -l"
}


change_ext() {
	for file in *.$1; do mv "$file" "${file%.'$1'}.$2"; done
}


my_du() {
  find "$1" -maxdepth 1 -mindepth 1 -print0 | xargs --null du -sh | sort -h
}
