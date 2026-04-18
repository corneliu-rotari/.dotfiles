up() {
	case "$1" in
	"dot")
		cd ~/.dotfiles || return 1 
    if git diff --quiet || git diff --cached --quiet; then # check for changes
      git pull && cd - || return 0  # no changes
    else
      git stash push
      git pull 
      git stash pop
      cd -
    fi 
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
      up && \
      up nvm && \
      bob erase && bob use stable
    ;;
  "brew")
      if command -v brew >/dev/null 2>&1; then
        brew update && brew upgrade && brew cleanup
      fi
    ;;
  "system")
      if [[ -f /etc/os-release ]]; then
        . /etc/os-release
        case "$ID" in
          ubuntu|debian)
            sudo apt-get update && sudo apt-get upgrade -y 
            up brew
            ;;
          arch)
            if command -v yay >/dev/null 2>&1; then
              yay -Syu
            else
              sudo pacman -Syu
            fi
            ;;
          fedora)
            sudo dnf update -y
            ;;
          *)
            return 1
            ;;
        esac
      fi
    ;;
	*)
    up system
    omz update
    up dot
		;;
	esac
}
