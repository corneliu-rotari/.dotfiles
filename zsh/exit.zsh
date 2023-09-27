exit_handler() {
	save_gnome
	if [ -n "$(git status --porcelain)" ]; then
		save_dotfiles "Generic save after exit."
	fi
}

