#!/bin/sh

# kill previous instances of this script before running
# $$ refers to the current process which is $0
for pid in `pgrep -f $0`; do
   if [[ $pid != $$ ]]; then
      kill $pid
   fi
done

# this scripts checks for the power level of two batteries
# notifies user if power gets below the supplied value

full=0
charging=0
draining=0
lowpower=0
l_limit=$1
u_limit=$2

GLITCHES="$HOME/Audio/glitches"
MECHANICAL="$HOME/Audio/mechanical"
tagname="battery"
appname="battery"

notify() {
  notify-send -a $appname -u $1 -i $2 \
    -h string:x-dunst-stack-tag:$tagname \
    -h int:value:"$4" "$3: $4%"
  paplay "$5"
}

while true; do
   bat0=`cat /sys/class/power_supply/BAT0/capacity`
   bat1=`cat /sys/class/power_supply/BAT1/capacity`
   stat0=`cat /sys/class/power_supply/BAT0/status`
   stat1=`cat /sys/class/power_supply/BAT1/status`
   charge=$(((bat0+bat1)/2))

   if [ "$stat0" = "Full" ] && [ "$stat1" = "Full" ]; then
      state="Full"
   elif [ $bat0 -ge $u_limit ] && [ $bat1 -ge $u_limit ]; then
      state="Full"
   elif [ "$stat0" = "Charging" ] || [ "$stat1" = "Charging" ]; then
      state="Charging"
   else
      state="Discharging"
   fi

   case $state in
      Full) 
         if [ $full -eq 0 ]; then
            full=1
            notify normal battery-full "charged at" $charge "$GLITCHES/glitch 1.wav"
         fi
         ;;

      Charging)
         full=0
         draining=0
         lowpower=0

         if [ $charging -eq 0 ]; then
            charging=1
            notify normal battery-medium "charging" $charge "$GLITCHES/glitch 33.wav"
            # 23 33 34
         fi
      ;;

      Discharging)
         full=0
         charging=0

         if [ $draining -eq 0 ]; then
            draining=1
            notify low battery "discharging" $charge "$GLITCHES/glitch 1.wav"
         fi

         if [ $bat0 -le $l_limit ] && [ $bat1 -le $l_limit ] && [ $lowpower -eq 0 ]; then
            lowpower=1
            notify critical battery-low "low power" $charge "$GLITCHES/glitch 13.wav"
         fi
      ;;
   esac

   sleep 5
done
