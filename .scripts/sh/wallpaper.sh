#!/bin/env zsh

# kill previous instances of this script before running
# $$ refers to the current process which is $0
for pid in $(pgrep -f $0); do
  if [[ $pid != $$ ]]; then
    kill $pid
  fi
done

state=$1
walls="$HOME/Pictures/wallpapers"
error_msg="Usage: $0 random, $0 slide <seconds> or $0 still <wallpaper.png>"
alpha="90" # https://www.reddit.com/r/tmux/comments/nrjtuh/comment/h0gygzy/

case $state in
  random)
    # feh -r --bg-fill --randomize --no-fehbg $walls
    image=$(ls -1 "$walls" | shuf -n 1)
    if [[ -n $WAYLAND_DISPLAY ]]; then
      swww img "$walls/$image"
    fi
    wal -i "$walls/$image" -a "$alpha"
    ;;

  still)
    if [[ -n "$2" ]]; then
      image=$2
      # feh --bg-fill --no-fehbg $walls/$image
      if [[ -n $WAYLAND_DISPLAY ]]; then
        swww img "$walls/$image"
      fi
      wal -i "$walls/$image" -a "$alpha"
    else
      echo $error_msg
    fi
    ;;

  slide)
    if [[ -n "$2" ]]; then
      time=$2

      while true; do
        walls=$(find "$HOME/Pictures/wallpapers" -type f | shuf)
        while read w; do
          # feh --no-fehbg --bg-fill "$w"
          if [[ -n $WAYLAND_DISPLAY ]]; then
            swww img "$w"
          fi
          wal -i "$w" -a "$alpha"
          sleep $time
        done < <(echo $walls)
      done
    else
      echo $error_msg
    fi
    ;;

  *)
    echo $error_msg
    ;;
esac
