#!/bin/sh

# kill previous instances of this script before running
# $$ refers to the current process which is $0
for pid in `pgrep -f $0`; do
  if [ $pid != $$ ]; then
    kill $pid
  fi
done

state=$1
walls="$HOME/Pictures/wallpapers"
error_msg="Usage: $0 random, $0 slide <seconds> or $0 still <wallpaper.png>"

case $state in
  random)
    feh -r --bg-fill --randomize --no-fehbg $walls
  ;;

  still)
    if [ ! -n "$2" ]; then 
      echo $error_msg
    else
      image=$2
      feh --bg-fill --no-fehbg $walls/$image
    fi
  ;;

  slide)
    if [ ! -n "$2" ]; then 
      echo $error_msg
    else 
      time=$2
      while true; do
        walls=`find "$HOME/Pictures/wallpapers" -type f | shuf`
        echo $walls | while read w; do
          feh --no-fehbg --bg-fill "$w"
          sleep $time
        done
      done
    fi 
  ;;

  *)
echo $error_msg
  ;;
esac
