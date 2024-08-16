up() {
	case "$1" in
	"dot")
		cd ~/.dotfiles && git pull && cd - || return
		;;
	"nvm")
		export NVM_DIR="$HOME/.nvm"
		[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
		[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

		nvm install --lts
		nvm use --lts
		if check input "Do you want to reinstall packages?"; then
			echo -n "Select a version from which to reinstall (e.g 18.13.0)"
			read -r vers
			nvm reinstall-packages "$vers"
		fi
		;;
  "all")
    up dot
    up
    up nvm
    ;;
	*)
		sudo apt-get update && sudo apt-get upgrade -y && brew update && brew upgrade && omz update
		;;
	esac
}
