#!/bin/env zsh

# kill previous instances of this script before running
# $$ refers to the current process which is $0
for pid in `pgrep -f $0`; do
   if [[ $pid != $$ ]]; then
      kill $pid
   fi
done

state=$1
walls="$HOME/Photos/wallpapers"
error_msg="Usage: $0 random, $0 slide <seconds> or $0 still <wallpaper.png>"

case $state in
   random)
      feh -r --bg-fill --randomize --no-fehbg $walls
   ;;

   still)
         if [[ -n "$2" ]]; then 
            image=$2
            feh --bg-fill --no-fehbg $walls/$image
         else
            echo $error_msg
         fi
   ;;

   slide)
      if [[ -n "$2" ]]; then 
         time=$2

         while true; do
            walls=`find "$HOME/Photos/wallpaper" -type f | shuf`
            while read w; do
               feh --no-fehbg --bg-fill "$w"
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
