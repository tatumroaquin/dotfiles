#!/bin/sh

if [ ! -f '/etc/udev/rules.d/input.rules' ]; then
    sudo gpasswd -a $USER input
    echo 'KERNEL=="uinput", GROUP="input", TAG+="uaccess"' | sudo tee '/etc/udev/rules.d/input.rules'
fi

if [ ! -f '/etc/modules-load.d/uinput.conf' ]; then
    echo 'uinput' | sudo tee '/etc/modules-load.d/uinput.conf'
fi

killall -wq xremap

xremap --watch "$XDG_CONFIG_HOME/xremap/config.yml"
