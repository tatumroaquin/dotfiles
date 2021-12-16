#!/bin/env zsh

# script to adjust screen backlight using F5 and F6 fn keys

param=$1

case $param in
   up)
      xbacklight -inc 2
      dunstctl close 0
      level=`printf "%0.0f" $(xbacklight -get)`
      notify-send -u low "backlight" "increased to $level"
      ;;
   down)
      xbacklight -dec 2
      dunstctl close 0
      level=`printf "%0.0f" $(xbacklight -get)`
      notify-send -u low "backlight" "decreased to $level"
      ;;
esac
