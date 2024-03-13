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
    local f=$(find ~/.local/share/tmux/resurrect -type f -name "*.txt" | fzf)
    read "new_name?Choose name without extenstion: "
    mv "$f" "$res/$new_name.txt"
    ;;
	*)
		echo "Unknown action required '$1'"
		;;
	esac
}
