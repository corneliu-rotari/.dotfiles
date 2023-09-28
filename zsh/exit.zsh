source "$DOT/zsh/functions.zsh"

exit_handler() {
	if check_wsl; then
		save_gnome
	fi
	cd "$DOT" || exit
	if [ -n "$(git status --porcelain)" ]; then
		save_dotfiles "Generic save after exit."
	fi
}
