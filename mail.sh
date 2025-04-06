#!/bin/bash

TO_TEAM=$1
SUBJECT=$2
ALERT_TYPE=$3
BODY=$4
ESCAPE_BODY=$(printf '%s\n' "$BODY" | sed -e 's/[]\/$*.^[]/\\&/g');
TO_ADDRESS=$5

FINAL_BODY=$(sed -e "s/TO_TEAM/$TO_TEAM/g" -e "s/ALERT_TYPE/$ALERT_TYPE/g" -e "s/BODY/$ESCAPE_BODY/g" mail-template.html)

echo "$FINAL_BODY" | s-nail -s "$SUBJECT" "$TO_ADDRESS"

#echo -e "$FINAL_BODY\nContent-Type: text/html" | s-nail -s "$SUBJECT" "$TO_ADDRESS"

#echo "FINAL_BODY" | s-nail -s "$SUBJECT" "$TO_ADDRESS"

#printf "%s\nContent-Type: text/html\n" "$SUBJECT" | s-nail -s "$(printf "%s\nContent-Type: text/html" "$SUBJECT")" "$TO_ADDRESS" <<< "$FINAL_BODY"


#printf "%s\nContent-Type: text/html\n" "$SUBJECT" | s-nail -s "$FINAL_BODY" "$TO_ADDRESS"


#echo "From: $FROM_ADDRESS\nTo: $TO_ADDRESS\nSubject: $SUBJECT\nMime-Version: 1.0\nContent-Type: text/html\nContent-Transfer-Encoding: 8bit\n\n$(cat mail-template.html)" | s-nail -s "$SUBJECT" $TO_ADDRESS"