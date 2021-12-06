#!/bin/env zsh

param=$1

case $param in 
   up)
      amixer -c 0 set Master 1%+
      #pactl set-sink-volume @DEFAULT_SINK@ +5%
      ;;
   down)
      amixer -c 0 set Master 1%-
      #pactl set-sink-volume @DEFAULT_SINK@ -5%
      ;;
   mute)
      amixer -c 0 set Master toggle
      #pactl set-sink-mute @DEFAULT_SINK@ toggle
      ;;
   silence)
      amixer -c 0 set Capture toggle
      #pactl set-source-mute @DEFAULT_SOURCE@ toggle
      ;;
esac
