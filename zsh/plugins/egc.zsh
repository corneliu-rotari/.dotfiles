egc() {
  frame="$HOME/dev/egc"
	case "$1" in
	"run")
		egc build
		"$frame/gfx-framework/build/bin/Debug/GFXFramework"
		;;
	"build")
		mkdir -p "$frame/gfx-framework/build"
		cd "$frame/gfx-framework/build" || return
		cmake ..
		make
		cd - || return
		;;
  "clean")
		rm -rf "$frame/gfx-framework/build"
		rm -rf "$frame/gfx-framework/.cache"
    ;;
	*)
    "$(clion $frame/gfx-framework &> /dev/null &)" &> /dev/null
		return
		;;
	esac
}
