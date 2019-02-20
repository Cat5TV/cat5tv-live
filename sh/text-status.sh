#!/bin/bash

# Actual realtime live status
#api=https://live.cat5.tv/api/realtime

# Toggle between on and off-air every 30 seconds
api=https://live.cat5.tv/api/test

echo "Press [CTRL+C] to stop.."

while :
do
  live=$(wget $api -q -O -)
  if [[ $live == "0" ]]; then
    echo "Off-Air"
  elif [[ $live == "1" ]]; then
    echo "On-Air"
  else
    echo "Unknown: $live"
  fi
  sleep 10
done
