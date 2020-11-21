#!/bin/sh

if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
    exit 1
fi
SPEED=-0.39
MOUSE=$1


if [ "$2" == "track" ]; then
  # Remap middleclick to back button
  # @see http://wiki.mbirth.de/know-how/software/linux/remapping-mouse-buttons.html for mappings
  xinput set-button-map "$MOUSE" 1 9 3 4 6 4 7 8
  SPEED=-0.9
fi

if [ "$2" == "logitech" ]; then
  SPEED=0
fi

for id in $(xinput --list | \
            sed -n '/'"$MOUSE"'.*pointer/s/.*=\([0-9]\+\).*/\1/p')
do
  xinput --set-prop "$id" "libinput Accel Speed" $SPEED
  xinput --set-prop "$id" 'libinput Accel Profile Enabled' 0, 1
done
