#!/bin/env zsh

# script to adjust screen backlight using F5 and F6 fn keys

param=$1

increase() {
   num=`xbacklight -get`
   xbacklight -set $((num*1.5))
}

decrease() {
   num=`xbacklight -get`
   xbacklight -set $((num/1.5))
}

case $param in
   up)
      increase
      dunstctl close 0
      level=`printf "%0.0f" $(xbacklight -get)`
      notify-send -u low "backlight" "increased to $level"
      ;;
   down)
      decrease
      dunstctl close 0
      level=`printf "%0.0f" $(xbacklight -get)`
      notify-send -u low "backlight" "decreased to $level"
      ;;
esac
