#!/bin/sh

INPUT_GROUP="$(fcitx5-remote -q)"
INPUT_NAME="$(fcitx5-remote -n)"

case "$(fcitx5-remote -n)" in
  'keyboard-us')
    INPUT_NAME="US"
    ;;

  'keyboard-us-dvorak')
    INPUT_NAME="DV"
    ;;

  'keyboard-us-colemak')
    INPUT_NAME="CO"
    ;;

  'pinyin')
    INPUT_NAME="ZH"
    ;;

  'mozc')
    INPUT_NAME="JP"
    ;;
esac

echo "$INPUT_GROUP $INPUT_NAME"
