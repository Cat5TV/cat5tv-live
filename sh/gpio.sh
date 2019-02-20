#!/bin/bash

# Actual realtime live status
#api=https://live.cat5.tv/api/realtime

# Toggle between on and off-air every 30 seconds
api=https://live.cat5.tv/api/test

# Which GPIO pin to use
pin=18


  if [[ -e /usr/local/bin/gpio ]]; then

    # Setup GPIO

      # Set the pin for output
      /usr/local/bin/gpio -g mode $pin output

      # Clear light state (turn off the power to GPIO pin)
      /usr/local/bin/gpio -g write $pin 0

      echo "Press [CTRL+C] to stop.."

      while :
      do
        live=$(wget $api -q -O -)
        if [[ $live == "0" ]]; then
          echo "Off-Air"
          /usr/local/bin/gpio -g write $pin 0
        elif [[ $live == "1" ]]; then
          echo "On-Air"
          /usr/local/bin/gpio -g write $pin 1
        else
          echo "Unknown: $live"
        fi
        sleep 10
      done

  else
    echo "You haven't installed wiringPi yet. Run install.sh"
  fi


