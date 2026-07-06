## credit to u/steven807196 of reddit for the original script
## WickedYoda is not responsible for any damage to your device or network. 
##Use at your own risk.

#!/bin/sh

# Configuration

TARGET_IP="192.168.8.128"

FLAG_FILE="/tmp/device_seen.flag"

DISCONNECT_TIME_FILE="/tmp/power_disconnected_time"

# 1. Check if the device is CURRENTLY connected

# Send a quick ping to force the router to check for the car

ping -c 1 -W 1 "$TARGET_IP" >/dev/null 2>&1

# Check the ARP table, but explicitly IGNORE stale "<incomplete>" entries

if arp -a | grep "$TARGET_IP" | grep -qv "<incomplete>"; then

# The car is currently connected!

touch "$FLAG_FILE"

rm -f "$DISCONNECT_TIME_FILE"

exit 0

