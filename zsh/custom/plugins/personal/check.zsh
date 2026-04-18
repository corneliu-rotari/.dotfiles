read_promt() {
	if [[ "$SHELL" == *"bash"* ]]; then
		read -rp "$1" user_input
	elif [[ "$SHELL" == *"zsh"* ]]; then
		read -r "user_input?$1"
  else
    echo "Unknown shell"
	fi
}

check() {
	case "$1" in
	"input")
		test "$#" -eq "2" || return $?
		read_promt "$2 [Y/n]"
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

confirm() {
  FMT="%-80s"
  printf "$FMT[Y/n]" "$1"
  read resp
  if [ -z "$resp" ]; then
      response_lc="y" # empty is Yes
  else
      response_lc=$(echo "$resp" | tr '[:upper:]' '[:lower:]') # case insensitive
  fi

  [ "$response_lc" = "y" ]
}

prt() {
  FMT="%-80s"
  printf "$FMT [$2]" "$1"
}
