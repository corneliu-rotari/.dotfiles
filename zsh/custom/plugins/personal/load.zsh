load() {
	case "$1" in
	"gnome")
		dconf load / <"$DOT/utils/gnome.conf"
		;;
	*)
		source "$HOME/.zshrc"
		source "$HOME/.zshenv"
		;;
	esac
}
