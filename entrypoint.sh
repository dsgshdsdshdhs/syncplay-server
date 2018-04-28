#!/bin/sh

args=""

if [ -n $SALT ]; then
  args="$args --salt=$SALT"
fi

if [ -n "$ISOLATE" ]; then
  args="$args --isolate-rooms"
fi

if [ -n "$MOTD"]; then
  echo "$MOTD" >> /motd
  args="$args --motd-file=/motd"
fi

if [ -n "$PASSWORD" ]; then
  args="$args --password=$PASSWORD"
fi

exec $(eval "./syncplayServer.py --port=80 $args $@")
