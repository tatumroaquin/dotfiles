#!/bin/sh

# script to adjust screen backlight using F5 and F6 fn keys
# dependencies: pacman -S bc

param=$1
appname="light"
tagname="brightness"

if ! groups | grep -qw "video"; then
  dunstify -a $appname -h string:x-dunst-stack-tag:$tagname "brightness" "$USER is not a member of the video group. Cannot change brightness level"
  exit 1
fi

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
   [ ${num%.*} -le 1 ] && sub=0.5
   light -S $sub
}

notify () {
  dunstify -a $appname -u $1 -i $2 \
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
