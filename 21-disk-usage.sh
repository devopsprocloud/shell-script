#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

THRESHOLD=1
DISK_USAGE=$(df -hT | grep xvd)
message=""



while IFS= read line
do 
   USAGE_PERCENTAGE=$(echo $line | awk '{print $6F}')
   DISK_PARTITION=$(echo $line | awk '{print $1F}')
   if [ $USAGE_PERCENTAGE -gt $THRESHOLD ]  
    then 
        echo -e "High Disk Usage on $R $DISK_PARTITION: $USAGE_PERCENTAGE $N"
    fi
done <<< $DISK_USAGE

