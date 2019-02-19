#!/bin/bash
live=$(wget https://live.cat5.tv/api -q -O -)
if [[ $live == "0" ]]; then
  echo "Off-Air"
elif [[ $live == "1" ]]; then
  echo "On-Air"
else
  echo "Unknown"
fi
