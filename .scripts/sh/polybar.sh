#!/bin/env zsh

# Terminate already existing bar instances

killall -qw polybar

# if your bars have IPC enabled, you can use:
# polybar-msg cmd quit

# Launch Polybar, using default config location ~/.config/polybar/config

polybar -l warning topbar 2>&1 | tee -a /tmp/polybar.log & disown
polybar -l warning botbar 2>&1 | tee -a /tmp/polybar.log & disown

echo "Polybars launched..."
