#!/bin/sh

bluetooth_print() {

  bluetoothctl | while read -r REPLY; do
  sv_status=`sudo sv status bluetoothd | cut -d: -f1`
  bt_powered=`bluetoothctl show | sed -e 's/\s//g' | grep "Powered" | cut -d':' -f2`
  if [ "$bt_powered" = "yes" ] && [ "$sv_status" = "run" ]; then
      printf 'ON'

      devices_paired=$(bluetoothctl devices Paired | grep Device | cut -d ' ' -f 2)
      counter=0

      for device in $devices_paired; do
          device_info=$(bluetoothctl info "$device")

          if echo "$device_info" | grep -q "Connected: yes"; then
              device_alias=$(echo "$device_info" | grep "Alias" | cut -d ' ' -f 2-)

              if [ $counter -gt 0 ]; then
                  printf ", %s" "$device_alias"
              else
                  printf " %s" "$device_alias"
              fi

              counter=$((counter + 1))
          fi
      done
      printf '\n'
    else
      echo "OFF"
    fi
  done
}

bluetooth_toggle() {
    if bluetoothctl show | grep -q "Powered: no"; then
        bluetoothctl power on >> /dev/null
        sleep 1

        devices_paired=$(bluetoothctl devices Paired | grep Device | cut -d ' ' -f 2)
        echo "$devices_paired" | while read -r line; do
            bluetoothctl connect "$line" >> /dev/null
        done
    else
        devices_paired=$(bluetoothctl devices Paired | grep Device | cut -d ' ' -f 2)
        echo "$devices_paired" | while read -r line; do
            bluetoothctl disconnect "$line" >> /dev/null
        done

        bluetoothctl power off >> /dev/null
    fi
}

case "$1" in
    --toggle)
        bluetooth_toggle
        ;;
    *)
        bluetooth_print
        ;;
esac
