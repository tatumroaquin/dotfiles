#!/bin/env zsh

param=$1

SCREENSHOTS="$HOME/Pictures/screenshots/"

[[ ! -d "$SCREENSHOTS" ]] && mkdir -p "$SCREENSHOTS"

filename=`date +"%Y-%m-%d_%H.%M.%S"`

case $param in 
   screen)
      maim $SCREENSHOTS/$filename.png
      notify-send -u low "Desktop Screenshot" "$filename.png"
      ;;
   partial)
      maim -s $SCREENSHOTS/$filename.png
      notify-send -u low "Partial Screenshot" "$filename.png"
      ;;
    window)
      maim -i $(xdotool getactivewindow) $SCREENSHOTS/$filename.png
      notify-send -u low "Window Screenshot" "$filename.png"
esac
