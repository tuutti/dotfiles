#!/bin/bash
case $(cat ~/.i3_layout) in
    default)    i3-msg layout stacking; echo "stacking" > ~/.i3_layout    ;;
    stacking)   i3-msg layout tabbed; echo "tabbed" > ~/.i3_layout        ;;
    *)          i3-msg layout default; echo "default" > ~/.i3_layout      ;;
esac
