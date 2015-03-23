#!/bin/bash
function confirm_upload {
  if [ ! -z "$1" ]; then
    exec sxiv $1 &
    # @todo: Better way to close nagbar after clicking button.
    exec i3-nagbar -t warning -m 'Upload screenshot?' -b 'Yes' "$0 upload $1;pkill i3-nagbar" -b 'No' "$0 remove $1;pkill i3-nagbar"
  fi
}

# echo $value xclip -o -selection clipboard

FILENAME="$HOME/Pictures/$(date +%Y-%m-%d_%H-%M-%S).png"

case $1 in
  -a)
    activeWinLine=$(xprop -root | grep "_NET_ACTIVE_WINDOW(WINDOW)")
    activeWinId=${activeWinLine:40}
    import -window "$activeWinId" $FILENAME

    confirm_upload $FILENAME
    exit
    ;;
  -s)
    exec scrot -s $FILENAME

    confirm_upload $FILENAME
    exit
    ;;
  upload)

    # Check that file exists.
    if [ ! -f $2 ]; then
      exit
    fi
    exec scp $2 lakka:public_html/temp

    exit
    ;;

  remove)
    if [ ! -f $2 ]; then
      exit
    fi

    rm $2
    exit
    ;;

  *)
    scrot $FILENAME

    confirm_upload $FILENAME
    exit
    ;;
esac
