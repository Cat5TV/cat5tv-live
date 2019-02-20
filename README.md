# cat5tv-live
Do something when Category5 Technology TV is live.

https://live.cat5.tv/api/realtime - return either 0 (not live) or 1 (live).

https://live.cat5.tv/api/test - return either 0 (not live) or 1 (live), changes automatically every 30 seconds (for testing).

Here are some experimental tools to tap into this.

## Scripts

###/sh

install.sh - Install wiringPi to allow use of Raspberry Pi GPIO
text-status.sh - Output plain text on/off-air. Defaults to test API.
gpio.sh - In addition to text output, enable GPIO pin 24 if on-air and disable it if not. Defaults to test API.
