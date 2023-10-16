
save() {
	if [ "$#" -lt 1 ]; then
		return
	elif [[ "$1" == "dot" ]]; then
		cd "$DOT" || return
		git add .
		git commit -m $2
		git push
		cd - || exit
  elif [[ "$1" == "gnome" ]]; then
    dconf dump / > "$DOT/utils/gnome.conf"
	fi
}
