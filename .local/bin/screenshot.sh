#!/bin/env zsh

param=$1

case $param in 
   screen)
      filename=`date +"%Y-%m-%d_%H.%M.%S"`
      maim ~/Pictures/screenshots/$filename.png
      notify-send -u low "Desktop Screenshot" "$filename.png"
      ;;
   partial)
      filename=`date +"%Y-%m-%d_%H.%M.%S"`
      maim -s ~/Pictures/screenshots/$filename.png
      notify-send -u low "Partial Screenshot" "$filename.png"
      ;;
esac
