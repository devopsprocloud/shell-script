#!/bin/bash

THRESHOLD=1
DISK_USAGE=$(df -hT | grep xvd)
message=""
USAGE_PERCENTAGE=$(df -hT | grep xvd | awk -F  '{print $6F}' | cut -d % -f1)
DISK_VOLUMES=$(df -hT | grep xvd | awk -F  '{print $1F}')

while IFS
do 
    if [ $USAGE_PERCENTAGE -gt 1 ]  
    then 
        echo "High Disk Usage on $DISK_VOLUMES"
    fi
done <<< $DISK_USAGE

