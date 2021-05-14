#!/bin/bash
sudo ls > /dev/null
xcalib -s 1 ~/dotfiles/resources/asus_mg279q.icc
feh --bg-fil Downloads/Pictures/w/pexels-cmonphotography-1809644.jpg
./.screenlayout/default.sh
./mouse.sh "Logitech G703" logitech
./scripts/keyboard-layout.sh
pavucontrol
sudo ntpd -gq
./scripts/polybar.sh
