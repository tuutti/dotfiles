#!/bin/sh
sudo umount -l /media/network/plex-movies
sudo umount -l /media/network/plex

ssh deluge@seedbox -fNL 2049:localhost:2049

sleep 5

sudo mount -v -t nfs -o port=2049,tcp localhost:/home/deluge/completed/btncompleted /media/network/plex
sudo mount -v -t nfs -o port=2049,tcp localhost:/home/deluge/completed/movies /media/network/plex-movies
