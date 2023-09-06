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
