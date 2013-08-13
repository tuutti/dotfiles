#!/bin/sh

CURRENT=$(setxkbmap -print | awk -F"+" '/xkb_symbols/ {print $2}')

if [ $CURRENT = 'fi' ]; then
  setxkbmap -layout 'us'
else
  setxkbmap -layout 'fi'
fi
