#!/bin/bash

DIR="/home/cornel/.dotfiles/install/save"
PM_S="$DIR/pm.txt"
BR_S="$DIR/brew.txt"

if command -v apt >/dev/null 2>&1; then
  grep "Commandline: apt install" /var/log/apt/history.log | sed 's/ -y//' | sed 's/^Commandline: apt install //' | sort | uniq >"$PM_S"
elif command -v rpm >/dev/null 2>&1; then
  rpm -qa | sort | uniq >"$PM_S"
elif command -v pacman >/dev/null 2>&1; then
  pacman -Qqe | sort | uniq >"$PM_S"
fi

if command -v brew >/dev/null 2>&1; then
  brew leaves --installed-on-request >"$BR_S"
fi
