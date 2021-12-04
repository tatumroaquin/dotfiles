#!/bin/env zsh

param=$1

case $param in
   up)
      xbacklight -inc 5
      ;;
   down)
      xbacklight -dec 5
      ;;
esac
