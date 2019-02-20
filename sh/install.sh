#!/bin/bash
if [[ $EUID -ne 0 ]]; then
  echo "ERROR: This script must be run as root" 2>&1
  exit 1
else

  if [[ ! -e /usr/bin/git ]]; then
    apt -y install git
  fi

  if [[ ! -d /usr/local/bin/gpio ]]; then
    cd /tmp
    git clone git://git.drogon.net/wiringPi
    cd wiringPi
    ./build # The build process places the compiled gpio application in /usr/local/bin/
    rm -rf /tmp/wiringPi
  else
    echo "wiringPi already installed."
  fi

fi
