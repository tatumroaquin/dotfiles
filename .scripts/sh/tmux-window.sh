#!/usr/bin/env bash

# https://dev.to/pratham/tmux-fast-window-switching-across-sessions-3n0c

if [ $# -eq 1 ]; then
  window="$1"
else
  window="$(tmux list-windows -a -F "#S:#I-#W"| fzf-tmux -p)"
fi

if [ -z "$window" ]; then
  exit 0
fi

target=${window%-*}

tmux switch-client -t "$target"
