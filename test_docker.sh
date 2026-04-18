#!/bin/bash

DISTROS=(
  "ubuntu"
  #"debian"
  #"fedora"
 # "arch"
)

for distro in "${DISTROS[@]}"; do
  echo "Testing on $distro..."
  docker run --rm -v $(pwd):/home/dev/.dotfiles dotfiles-test:$distro sh -c "cd ./.dotfiles && ./install.sh"
done
