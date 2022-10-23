#!/bin/sh

name=polybar
for pid in `pidof -x $name`; do
  kill $pid
done

polybar 2>&1 | tee -a /tmp/polybar.log & disown
