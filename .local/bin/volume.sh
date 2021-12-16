#!/bin/sh

param=$1
case $param in 
   up)
      amixer -q -c 0 set Master 1%+
      volume=`amixer get Master | tail -1 | awk -F "[][]" '{print $2}'`
      dunstctl close 0
      notify-send -u low -t 1000 "volume" "increase $volume"
      #pactl set-sink-volume @DEFAULT_SINK@ +5%
      ;;

   down)
      amixer -q -c 0 set Master 1%-
      volume=`amixer get Master | tail -1 | awk -F "[][]" '{print $2}'`
      dunstctl close 0
      notify-send -u low -t 1000 "volume" "decrease $volume"
      #pactl set-sink-volume @DEFAULT_SINK@ -5%
      ;;

   mute)
      amixer -q -c 0 set Master toggle
      state=`amixer get Master | tail -1 | awk -F "[][]" '{print $6}'`

      if [ $state == "off" ]; then
      dunstctl close 0
         notify-send -u critical -t 1000 "volume" "muted"
      else
      dunstctl close 0
         notify-send -u low -t 1000 "volume" "unmuted"
      fi
      #pactl set-sink-mute @DEFAULT_SINK@ toggle
      ;;

   silence)
      amixer -q -c 0 set Capture toggle
      state=`amixer get Capture | tail -1 | awk -F "[][]" '{print $6}'`
      if [ $state == "off" ]; then
         dunstctl close 0
         notify-send -u critical -t 1000 "microphone" "silenced"
      else
         dunstctl close 0
         notify-send -u low -t 1000 "microphone" "enabled"
      fi
      #pactl set-source-mute @DEFAULT_SOURCE@ toggle
      ;;
esac
