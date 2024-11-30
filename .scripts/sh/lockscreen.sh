#!/bin/sh

icon="$HOME/Pictures/assets/anilist-eye.png"
tmpbg='/tmp/screen.png'

[ $# -ne 0 ] && icon=$1

maim "$tmpbg"
magick "$tmpbg" -scale 10% -scale 1000% "$tmpbg"
magick "$tmpbg" "$icon" -gravity center -composite -alpha Set "$tmpbg"

wpctl set-mute @DEFAULT_SINK@ toggle

i3lock \
  --nofork \
  -e -i "$tmpbg" \
  --ring-width="20" \
  --line-color="00ff00dd" \
  --verif-text="verify" \
  --verif-font="Hack Nerd Font Propo" \
  --verif-font="12" \
  --wrong-text="wrong" \
  --wrong-font="Hack Nerd Font Propo" \
  --wrong-font="12" \
  --insidever-color="fa9c1bbb" \
  --ringver-color="fa9c1bff" \
  --modif-color="0000ffff"
