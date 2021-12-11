#!/bin/env zsh

param=$1

case $param in 
   screen)
      maim ~/Photos/screenshots/$(date +"%Y-%m-%d_%H.%M.%S").png
      ;;
   partial)
      maim -s ~/Photos/screenshots/$(date +"%Y-%m-%d_%H.%M.%S").png
      ;;
esac
