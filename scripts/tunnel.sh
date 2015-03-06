#!/bin/sh
if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
    exit 1
fi
ssh -C2qTnNf -D 8080 "$@";
