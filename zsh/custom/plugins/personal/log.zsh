log() {
	case "$1" in
	"top")
		clear
		line='='
		name="[$2]"
		x=$((($(tput cols) - 4) / 2))
		for i in $(seq 1 $x); do line="=${line}"; done
		padding="${line:$((${#name} / 2))}"
		printf "%s%s%s\n" $padding $name $padding
		;;
	"error")
    echo "[$funcstack[0]] $1 does not exist"
		;;
	*)
		echo default
		;;
	esac
}
