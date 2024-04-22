#!/bin/sh
# install "dumb_runtime_dir" to set $XDG_RUNTIME_DIR
# and make sure to enable pipewire and pipewire-pulse

# pactl set-sink-volume @DEFAULT_SINK@ +2%
# pactl set-sink-volume @DEFAULT_SINK@ -2%
# pactl set-sink-mute @DEFAULT_SINK@ toggle
# pactl set-source-mute @DEFAULT_SOURCE@ toggle

# volume=`amixer get Master | tail -1 | awk -F "[][]" '{print $2}'`
#`amixer get Capture | tail -1 | awk -F "[][]" '{print $6}'`
# volume=`pactl get-sink-volume @DEFAULT_SINK@`
# amixer -q -c 0 set Capture toggle
# pactl set-source-mute @DEFAULT_SOURCE@ toggle

param=$1
appname="pamixer"
tagname="audio"

notify() {
  notify-send -a $appname -u $1 -i $2 \
    -h string:x-dunst-stack-tag:$tagname \
    -h int:value:"$4" "$3: $4"
}

case $param in 
   up)
      pamixer --increase 2
      level=`pamixer --get-volume`
      notify low audio-volume-high volume $level
      ;;

   down)
      pamixer --decrease 2
      level=`pamixer --get-volume`
      if [ $level -eq 0 ]; then
        notify critical audio-volume-muted volume $level
      else
        notify low audio-volume-low volume $level
      fi
      ;;

   mute)
      pamixer --toggle-mute
      level=`pamixer --get-volume`
      muted=`pamixer --get-mute`
      if ( $muted ); then
        notify critical audio-volume-muted volume $level
      else
        notify low audio-volume-medium volume $level
      fi
      ;;

   silence)
      pamixer --default-source --toggle-mute
      state=`pamixer --default-source --get-mute`
      if ( $state ); then
        notify critical mic-off microphone silenced
      else
        notify normal mic-off microphone enabled
      fi
      ;;
esac
