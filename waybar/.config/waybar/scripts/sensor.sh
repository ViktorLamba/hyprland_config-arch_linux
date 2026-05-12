#!/bin/bash
sensors | tee /tmp/sensors_output | yad --text-info --width=400 --height=300 --title="Temperature Sensors"
chmod +x ~/.config/waybar/scripts/sensor.sh
