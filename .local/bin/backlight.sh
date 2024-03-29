#!/bin/sh

# script to adjust screen backlight using F5 and F6 fn keys
# dependencies: pacman -S bc

param=$1
appname="light"
tagname="brightness"

increase() {
   num=`printf "%0.2f" $(light -G)`
   add=`printf "%0.2f" $(echo "$num * 1.3" | bc)`
   light -S $add
}

decrease() {
   #num=`xbacklight -get`
   #xbacklight -set `echo $num/1.5 | bc`

   num=`printf "%0.2f" $(light -G)`
   sub=`printf "%0.2f" $(echo "$num / 1.3" | bc)`
   [ ${num%.*} -lt 1 ] && sub=$num && return
   light -S $sub
}

notify () {
  notify-send -a $appname -u $1 -i $2 \
    -h string:x-dunst-stack-tag:$tagname \
    -h int:value:"$4" "$3: $4%"
}

case $param in
   up)
      increase
      level=`printf "%0.0f" $(light -G)`
      notify low computer-laptop brightness $level
      ;;
   down)
      decrease
      level=`printf "%0.0f" $(light -G)`
      notify low computer-laptop brightness $level
      ;;
esac
