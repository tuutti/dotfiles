#!/bin/sh

if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
    exit 1
fi

MOUSE=$1
DEVICE=$2

case "$DEVICE" in
  "raw")
    DECELERATION=1.9
    SCALING=10
    ;;
  "ss")
    DECELERATION=1.7
    SCALING=10
    ;;
  "zowie")
    DECELERATION=0.85
    SCALING=10
    ;;
esac
xinput --set-prop "$MOUSE" "Device Accel Constant Deceleration" $DECELERATION
xinput --set-prop "$MOUSE" "Device Accel Velocity Scaling" $SCALING
