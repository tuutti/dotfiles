#!/bin/sh

if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
    exit 1
fi
SPEED=-0.65
MOUSE=$1

if [ "$2" == "track" ]; then
  # Remap middleclick to back button
  # @see http://wiki.mbirth.de/know-how/software/linux/remapping-mouse-buttons.html for mappings
  xinput set-button-map "$MOUSE" 1 9 3 4 6 4 7 8
  xinput --set-prop "$MOUSE" "libinput Scroll Method Enabled" 0 0 1
  xinput --set-prop "$MOUSE" "libinput Button Scrolling Button" 3
  xinput --set-prop "$MOUSE" "libinput Accel Profile Enabled" 0 0
  xinput set-prop "$MOUSE" "libinput Accel Speed" -0.6
else
  xinput set-prop "$MOUSE" "libinput Accel Speed" $SPEED
fi
