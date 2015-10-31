#!/bin/sh

if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
    exit 1
fi

MOUSE=$1
SS_DECELERATION=1.7
SS_SCALING=10
ZOWIE_DECELARTION=0.85
ZOWIE_SCALING=10
xinput --set-prop "$MOUSE" "Device Accel Constant Deceleration" $ZOWIE_DECELARTION
xinput --set-prop "$MOUSE" "Device Accel Velocity Scaling" $ZOWIE_SCALING
