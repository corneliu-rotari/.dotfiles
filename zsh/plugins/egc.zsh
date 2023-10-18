egc() {
	case "$1" in
	"run")
		egc build
		"$HOME/dev/gfx-framework/build/bin/Debug/GFXFramework"
		;;
	"build")
		mkdir -p "$HOME/dev/gfx-framework/build"
		cd "$HOME/dev/gfx-framework/build" || return
		cmake ..
		make
		cd - || return
		;;
  "clean")
		rm -rf "$HOME/dev/gfx-framework/build"
    ;;
	*)
		code "$HOME/dev/gfx-framework"
		return
		;;
	esac
}
