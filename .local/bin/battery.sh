#!/bin/sh

# this scripts checks for the power level of two batteries
# notifies user if power gets below the supplied value

while true; do
   bat0=`cat /sys/class/power_supply/BAT0/capacity`
   bat1=`cat /sys/class/power_supply/BAT0/capacity`

   if [ $bat0 -le $1 ] || [ $bat1 -le $1 ]; then
      notify-send -u critical 'battery' 'low power'
      break;
   fi
   sleep 60;
done
