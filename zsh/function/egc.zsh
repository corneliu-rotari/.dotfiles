egc() {
	if [ "$#" -lt "1" ]; then
		code "$HOME/dev/gfx-framework"
		return
	fi
	if [[ "$1" == "run" ]]; then
		egc build
		"$HOME/dev/gfx-framework/build/bin/Debug/GFXFramework"
	elif [[ "$1" == "build" ]]; then
		mkdir -p "$HOME/dev/gfx-framework/build"
		cd "$HOME/dev/gfx-framework/build" || exit
		cmake ..
		make
		cd - || exit
	elif [[ "$1" == "clean" ]]; then
		rm -rf "$HOME/dev/gfx-framework/build"
	fi
}
