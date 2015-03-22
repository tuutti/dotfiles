#!/bin/bash

while :
do
  echo "$(curl http://ipinfo.io/ip)" | ssh lakka 'xargs -0 > ~/ip'
  sleep 5h
done
