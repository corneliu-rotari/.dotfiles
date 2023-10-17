export ZSH="$DOT/modules/oh-my-zsh"
export ZSH_CUSTOM="$DOT_ZSH/custom"
export ZSH_THEME="lambda"
ZSH_TMUX_AUTOSTART=true
zstyle ':omz:update' mode reminder # just remind me to update when it's time

plugins=(
	git
  svn
  tmux
	zsh-autosuggestions
	zsh-syntax-highlighting
  zsh-vi-mode
)

prompt_svn() {
    local rev branch
    if in_svn; then
        rev=$(svn_get_rev_nr)
        branch=$(svn_get_branch_name)
        if [[ $(svn_dirty_choose_pwd 1 0) -eq 1 ]]; then
            prompt_segment yellow black
            echo -n "$rev@$branch"
            echo -n "±"
        else
            prompt_segment green black
            echo -n "$rev@$branch"
        fi
    fi
}

build_prompt() {
    RETVAL=$?
    prompt_status
    prompt_context
    prompt_dir
    prompt_git
    prompt_svn
    prompt_end
}
source_if() {
	if test -r "$1"; then
		source "$1"
  else
    echo "[$funcstack[1]] $1 does not exist"
	fi
}

source_if "$ZSH/oh-my-zsh.sh"
source_if "$DOT_ZSH/alias/init.zsh"
source_if "$DOT_ZSH/function/init.zsh"
source_if "$DOT_ZSH/exit.zsh"
source_if "$HOME/.cargo/env"
source_if "$HOME/.ghcup/env"


trap 'exit_handler' EXIT 


