load() {
	if [ "$#" -lt 1 ]; then
		source "$HOME/.zshrc"
		source "$HOME/.zshenv"
	elif [[ "$1" == "gnome" ]]; then
		dconf load / <"$DOT/utils/gnome.conf"
	elif [[ "$1" == "tmux" ]]; then
		res="$HOME/.local/share/tmux/resurrect"
		if [ "$#" -lt "2" ]; then
			echo "Please choose which config to use"
			\ls "$res" -I "last" -I "pane_contents.tar.gz" -I "save"
		else
			ln_if "$res/$1" "$res/last"
		fi
	fi
}
