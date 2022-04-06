#!/bin/bash
FILE=/tmp/gh-notifier-timestamp

function get_last_run {
  if [ ! -f "$FILE" ]; then
    echo $(date --utc --date='2020-01-01')
    return 0
  fi
  cat $FILE
  return 0
}

function update_last_run {
  echo "$(date --utc)" > $FILE
}

function send_notifications {
  for LINE in $(gh api notifications -H "If-Modified-Since: ${1}"| jq -r '.[] | @base64'); do
    _jq() {
      echo ${LINE} | base64 --decode | jq -r ${1}
    }
    notify-send -u normal "Github: [$(_jq .subject.type)] $(_jq .subject.title)"
    update_last_run
  done
}

while true
do
  send_notifications "$(get_last_run)"
  sleep 60
done
