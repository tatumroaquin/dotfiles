#!/bin/env zsh

# script to adjust screen backlight using F5 and F6 fn keys

param=$1

case $param in
   up)
      xbacklight -inc 5
      ;;
   down)
      xbacklight -dec 5
      ;;
esac
