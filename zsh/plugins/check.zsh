check() {
	case "$1" in
	"input")
    local user_input
    test "$#" -eq "2" || return $?
		read -r "user_input?$2 [Y/n] "
		[ "$user_input" != "n" ] && [ "$user_input" != "N" ] && [ "$user_input" != "no" ] && [ "$user_input" != "No" ]
		;;
	"wsl")
		sys_info="$(uname -a)"
		[[ "$sys_info" == *"Microsoft"* ]] || [[ "$sys_info" == *"microsoft"* ]] || [[ "$sys_info" == *"WSL"* ]]
		;;
	*)
    echo "Unknown check"
		;;
	esac
}
