#!/usr/bin/sh
#
for i in $(seq 0 255) ; do
    printf "\x1b[38;5;%smcolour%s\n" "${i}" "${i}"
done
