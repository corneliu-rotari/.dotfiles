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
  "tmux")
		local res="$HOME/.local/share/tmux/resurrect"
		\ls "$res" -I "last" -I "pane_contents.tar.gz" -I "save" -I "restore"
    read "old_name?Choose the file to change : "
    read "new_name?Choose the new name : "
    mv "$res/$old_name"  "$res/$new_name"
    ;;
	*)
		echo "Unknown action required '$1'"
		;;
	esac
}
