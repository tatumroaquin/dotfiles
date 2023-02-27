#!/bin/sh

icon="$HOME/Pictures/assets/anilist-eye.png"
tmpbg='/tmp/screen.png'

[ $# -ne 0 ] && icon=$1

maim "$tmpbg"
convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg"
convert "$tmpbg" "$icon" -gravity center -composite -matte "$tmpbg"
i3lock --nofork -u -i "$tmpbg"
