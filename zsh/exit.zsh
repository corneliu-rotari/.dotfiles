source "$DOT/zsh/functions.zsh"

exit_handler() {
	if check_input "Save on exit?"; then
		if ! check_wsl; then
			save_gnome
		fi
		cd "$DOT" || exit
		if [ -n "$(git status --porcelain)" ]; then
			save_dotfiles "Generic save after exit."
		fi
	fi
}
