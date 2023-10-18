load() {
	case "$1" in
	"tmux")
		local res="$HOME/.local/share/tmux/resurrect"
    local filename=""
		\ls "$res" -I "last" -I "pane_contents.tar.gz" -I "save" -I "restore"
		read -r "filename?Please choose which config to use : "
		if [ -e "$res/$filename" ]; then
			ln_if "$res/$filename" "$res/last"
		fi
		;;
	"gnome")
		dconf load / <"$DOT/utils/gnome.conf"
		;;
	*)
		source "$HOME/.zshrc"
		source "$HOME/.zshenv"
		;;
	esac
}
