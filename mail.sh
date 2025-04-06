#!/bin/bash

TO_TEAM=$1
SUBJECT=$2
ALERT_TYPE=$3
BODY=$4
ESCAPE_BODY=$(printf '%s\n' "$BODY" | sed -e 's/[]\/$*.^[]/\\&/g');
TO_ADDRESS=$5

FINAL_BODY=$(sed -e "s/TO_TEAM/$TO_TEAM/g" -e "s/ALERT_TYPE/$ALERT_TYPE/g" -e "s/BODY/$ESCAPE_BODY/g" mail-template.html)

#echo "$FINAL_BODY" | s-nail -s "$(printf -e "$SUBJECT\nContent-Type: text/html")" "$TO_ADDRESS"

printf "%s\nContent-Type: text/html\n" "$SUBJECT" | s-nail -s "$FINAL_BODY" "$TO_ADDRESS"
