#!/bin/bash

echo "please enter the number: "
read number # we can take it as an argument also ex: NUMBER=$1

if [ $number -gt 100 ]
then
    echo "The given number is greater than 100."
else
   echo "The given number is less than 100."
fi