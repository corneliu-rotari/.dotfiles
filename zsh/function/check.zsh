T=0
F=1

check() {
	if [ "$#" -lt "1" ]; then
		echo "message"
	elif [[ "$1" == "wsl" ]]; then
		sys_info="$(uname -a)"
		if [[ "$sys_info" == *"Microsoft"* ]] || [[ "$sys_info" == *"microsoft"* ]] || [[ "$sys_info" == *"WSL"* ]]; then
			return $T
		fi
		return $F
	elif [[ "$1" == "input" ]]; then
		echo
		echo -n "$2 [Y/n] "
		read -r user_input
		if [ "$user_input" != "n" ] && [ "$user_input" != "N" ] && [ "$user_input" != "no" ] && [ "$user_input" != "No" ]; then
			return $T
		else
			return $F
		fi
	fi
}
