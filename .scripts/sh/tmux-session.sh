#!/usr/bin/env bash

# https://raw.githubusercontent.com/ThePrimeagen/.dotfiles/master/bin/.local/scripts/tmux-sessionizer

dirlist=(~/Code ~/Obsidian ~/Documents ~/.config ~/.scripts)

get_dir() {
	for dir in "${dirlist[@]}"; do
		find "$dir" -mindepth 1 -maxdepth 1 -type d
	done | fzf-tmux -p 50%,100%
}

# if args is equal to 1
if [ $# -eq 1 ]; then
	session_dir=$1
else
	session_dir=$(get_dir)
fi

# if $session_dir string is empty exit no errors
if [ -z "$session_dir" ]; then
	exit 0
fi

session_name=$(basename "$session_dir" | tr -cs "a-zA-Z0-9-_\n" "_")

# tmux is running
if [ -z "$TMUX" ]; then
	tmux new-session -c "$session_dir" -s "$session_name"
fi

# tmux has no session named $session_name create one
if ! tmux has-session -t "$session_name" 2>/dev/null; then
	tmux new-session -c "$session_dir" -ds "$session_name"
fi

# send signal to switch client to $session_name
tmux switch-client -t "$session_name"
