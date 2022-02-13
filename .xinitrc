#!/bin/sh
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi
# Disable caps lock effect
setxkbmap -option caps:none
export PATH=/home/tuutti/bin:/home/tuutti/scripts:$PATH
export XDG_CONFIG_HOME="/home/tuutti/.config"
export EDITOR=nvim
export BROWSER=qutebrowser
export QT_QPA_PLATFORMTHEME="qt5ct"

setxkbmap -layout fi

xrdb ~/.Xresources
# Disable screen blanking until X crash bug is fixed.
xset -dpms; xset s off

#compton --config ~/.compton.conf -b --xrender-sync --xrender-sync-fence &

# Laptop specific configs.
if [ "$(hostname)" = "pad" ]; then
  exec ~/scripts/touchpad.sh &
  exec i3
else
  xkbcomp -I$HOME/.config/xkb $HOME/.config/xkb/hhkb.xkb $DISPLAY

  xcalib -d :0 ~/dotfiles/resources/asus_rog_Swift_pg279q.icc
  exec i3
fi
