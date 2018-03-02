#!/usr/bin/env sh

killall -q polybar

while pgrep -x polybar >/dev/null; do sleep 1; done

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected primary" | cut -d" " -f1); do
    MONITOR=$m polybar -r -c $HOME/.config/polybar/config primary &
  done
fi

polybar -c $HOME/.config/polybar/config secondary &

echo "Bars launched..."
