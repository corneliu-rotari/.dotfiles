alias func="functions | grep -a -G \"^[a-z].*()\""
alias apt="sudo /usr/bin/apt"
alias rr='sudo su -'
alias ls="exa --icons"
alias off_note_display="xrandr --output eDP --off"


ln_if() {
	if [ -e "$2" ] || [ -L "$2" ]; then
		echo "[Deleted] $2"
		rm -rf "$2"
	fi

	ln -s "$1" "$2"
	echo "[Created] Symbolic Link to $2"
}


tree() {
	if [ $# -ne 1 ]; then
		ls --tree --level=3
	else
		ls --tree --level="$1"
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
