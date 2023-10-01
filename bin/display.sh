#!/bin/sh
. "$DOT/zsh/aliases.zsh"

nr_monitors=$(xrandr --listactivemonitors | wc -l)

if [ $nr_monitors -eq 3 ]; then
  off_note_display
fi
