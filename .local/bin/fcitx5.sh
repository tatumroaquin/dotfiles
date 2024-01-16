#!/bin/sh

INPUT_GROUP="$(fcitx5-remote -q)"
INPUT_METHOD="US"

case "$(fcitx5-remote -n)" in
  'keyboard-us')
    INPUT_METHOD="US"
    ;;

  'keyboard-us-dvorak')
    INPUT_METHOD="DV"
    ;;

  'pinyin')
    INPUT_METHOD="ZH"
    ;;

  'mozc')
    INPUT_METHOD="JP"
    ;;
esac

echo "$INPUT_GROUP $INPUT_METHOD"
