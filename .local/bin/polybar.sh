#!/bin/env zsh

# Terminate already existing bar instances

killall -q polybar

# if your bars have IPC enabled, you can use:
# polybar-msg cmd quit

# Launch Polybar, using default config location ~/.config/polybar/config

polybar topbar 2>&1 | tee -a /tmp/polybar.log & disown
polybar botbar 2>&1 | tee -a /tmp/polybar.log & disown

echo "Polybars launched..."
