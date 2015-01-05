#!/bin/sh
if [-d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" && . "$f"
  done
  unset f
fi

#compton -CGb
# Disable caps lock effect
setxkbmap -option caps:none
export PATH=$PATH:/home/tuutti/bspwm:/home/tuutti/bin
export XDG_CONFIG_HOME="/home/tuutti/.config"
export BSPWM_SOCKET="/tmp/bspwm-socket"
export EDITOR=vim
export BROWSER=firefox

xset +fp /usr/share/fonts/local
xset fp rehash

xsetroot -cursor_name left_ptr

setxkbmap -layout fi

xrdb ~/.Xresources

#pulseaudio --start

# Automount
udiskie &

xset -dpms
xset s off

nvidia-settings --load-config-only

# http://askubuntu.com/questions/125245/how-do-i-stop-video-tearing-nvidia-prop-driver-non-compositing-window-manager#comment167226_140036
export __GL_SYNC_DISPLAY_DEVICE="DFP-1"

#sxhkd -c "/home/tuutti/.config/sxhkd/sxhkdrc" &
#sxhkd &

#[ -e "$PANEL_FIFO" ] && rm "$PANEL_FIFO"
#mkfifo "$PANEL_FIFO"
#exec bspwm -s "$PANEL_FIFO" -p W
#exec bspwm
#exec bspwm -c "/home/tuutti/.config/bspwm/"
#exec i3
exec startxfce4
# Set backgrounds.
feh --bg-max ~/dotfiles/bg2.jpg --bg-max ~/dotfiles/bg.jpg
# Hide mouse.
unclutter -idle 1 &
