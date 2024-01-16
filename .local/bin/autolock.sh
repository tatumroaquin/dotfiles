#!/bin/sh

killall -qw xautolock

# amount of minutes before system executes suspend
suspend_time=$1 || 30

# amount of seconds before i3lock starts
lock_time=$2 || 10

xautolock \
  -time "$suspend_time" \
  -locker 'systemctl suspend' \
  -notify "$lock_time" \
  -notifier 'sh ~/.local/bin/lockscreen.sh' &
