#!/bin/sh

xinput set-prop "Elan Touchpad" "Synaptics Scrolling Distance" -75 -75
xinput set-prop "Elan Touchpad" "Synaptics Two-Finger Scrolling" 1 1
xinput set-prop "Elan Touchpad" "Synaptics Tap Action" 1 1 1 2 1 3 0
xinput set-prop "Elan Touchpad" "Synaptics Palm Detection" 1

# https://askubuntu.com/questions/403113/how-do-you-enable-tap-to-click-via-command-line
# https://gist.github.com/thealanle/328200a31bf14c238106827428bfa585
