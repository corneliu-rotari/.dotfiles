iphone() {
	connected="$(lsusb | grep 'Apple')"
	if [ -z $connected ]; then
		return
	fi

	storge_path="$HOME/iPhone"
	case "$1" in
	"obsidian")
		cd "$(find '/run/user/1000/' -name 'md.obsidian' 2>/dev/null)" || return
    cp -r * "$HOME/obsidian/iPhone"
    cd -
		;;
	*)
		echo "iphone [obsidian]"
		;;
	esac
}
