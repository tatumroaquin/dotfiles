#!/bin/env zsh

print_bytes() {
    if [ "$1" -eq 0 ] || [ "$1" -lt 1000 ]; then
        bytes="0 kB/s"
    elif [ "$1" -lt 1000000 ]; then
        bytes="$(echo "$1/1000" | bc -l | LANG=C xargs printf "%.f\n") kB/s"
    else
        bytes="$(echo "$1/1000000" | bc -l | LANG=C xargs printf "%.1f\n") MB/s"
    fi

    echo "$bytes"
}

print_bit() {
    if [ "$1" -eq 0 ] || [ "$1" -lt 10 ]; then
        bit="0 B"
    elif [ "$1" -lt 100 ]; then
        bit="$(echo "$1*8" | bc -l | LANG=C xargs printf "%.f\n") B"
    elif [ "$1" -lt 100000 ]; then
        bit="$(echo "$1*8/1000" | bc -l | LANG=C xargs printf "%.f\n") K"
    else
        bit="$(echo "$1*8/1000000" | bc -l | LANG=C xargs printf "%.1f\n") M"
    fi

    echo "$bit"
}

INTERVAL=2
INTERFACES="wlp4s0"

declare -A bytes

for iface in $INTERFACES; do
    bytes[past_rx_$iface]="$(cat /sys/class/net/"$iface"/statistics/rx_bytes)"
    bytes[past_tx_$iface]="$(cat /sys/class/net/"$iface"/statistics/tx_bytes)"
done

while true; do
    dlrate=0
    uprate=0

    for iface in $INTERFACES; do
        bytes[now_rx_$iface]="$(cat /sys/class/net/"$iface"/statistics/rx_bytes)"
        bytes[now_tx_$iface]="$(cat /sys/class/net/"$iface"/statistics/tx_bytes)"

        dlbytes=$((((${bytes[now_rx_$iface]} - ${bytes[past_rx_$iface]})) / INTERVAL))
        upbytes=$((((${bytes[now_tx_$iface]} - ${bytes[past_tx_$iface]})) / INTERVAL))

        dlrate=$(( $down + $dlbytes ))
        uprate=$(( $up + $upbytes ))

        bytes[past_rx_$iface]=${bytes[now_rx_$iface]}
        bytes[past_tx_$iface]=${bytes[now_tx_$iface]}
    done

    echo "DN:$(print_bytes $dlrate) UP:$(print_bytes $uprate)"
    # echo "Download: $(print_bit $down) / Upload: $(print_bit $up)"

    sleep $INTERVAL
done
