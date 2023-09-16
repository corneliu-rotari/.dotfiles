function tree {
    if [ $# -ne 1 ]; then
        ls --tree --level=3
    else
        ls --tree --level="$1"
    fi
}

function svn_all {
  clear
  for D in $(find /home/vcs/ -maxdepth 1 -type d)
  do
    if [[ "$D" != "/home/vcs/" ]]; then
    echo "$D"
    svn $@ $D
    echo
  fi
  done 
}

function vcs {
  cd /home/vcs/
  if [[ $# -eq 1 ]]
  then
    cd $1
  fi
}

function check_input()
{
  echo
  echo -n "$1 [Y/n] "
	read user_input 
  if [ "$user_input" != "n" ] && [ "$user_input" != "N" ] && [ "$user_input" != "no" ] && [ "$user_input" != "No" ] 
  then
    return 0 
  else
    return 1
  fi
}

function nvm_lts {
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

  nvm install --lts
  nvm use --lts
  if check_input "Do you want to reinstall packages?"
  then
    echo "Reinstalling"
  fi
}

function scd {
  ssh -t "$1" "cd /mnt/app/bin ; exec \$SHELL -l";
}

function save_dotfiles {
  cd ~/.dotfiles
  git add .
  git commit -m $1
  git push
}
