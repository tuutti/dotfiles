#!/bin/sh

if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
    exit 1
fi

MOUSE=$1
xinput --set-prop "$MOUSE" "Device Accel Constant Deceleration" 1.7
xinput --set-prop "$MOUSE" "Device Accel Velocity Scaling" 10
