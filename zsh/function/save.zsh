save() {
	case "$1" in
	"dot")
		test "$#" -gt 1 || return
		cd "$DOT" || return
		git add .
		git commit -m "${@:2}"
		git push
		cd - || return
		;;
	"gnome")
		dconf dump / >"$DOT/utils/gnome.conf"
		;;
	*)
		echo "Unknown action required '$1'"
		;;
	esac
}
