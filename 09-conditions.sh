#!/bin/bash

echo "what is today?"
read today

if [ $today != Sunday ]
then
    echo "Today is $today, Go to Office."
else
    echo "Today is $today, It's a holiday."
fi 

