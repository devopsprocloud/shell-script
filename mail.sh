#!/bin/bash

TO_ADDRESS=$1
SUBJECT=$2
ALERT_TYPE=$3
BODY=$4
ESCAPED_BODY=
FROM_ADDRESS=$5

FINAL_BODY=$(sed -e "s/TO_TEAM/$TO_TEAM/g" -e "s/ALERT_TYPE/$ALERT_TYPE/g" -e "s/BODY/$BODY/g" mail-template.html)

echo "$FINAL_BODY" | s-nail -s "$SUBJECT" $TO_ADDRESS