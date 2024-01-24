#!/bin/sh

killall -wq xremap

xremap --watch $XDG_CONFIG_HOME/xremap/config.yml
