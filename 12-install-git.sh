#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]
then 
    echo "You are not a 'root' user"
    exit 1
else
    dnf install gitt -y 
    if  [ $? -ne 0 ]
    then 
        echo "Installing Git is FAILED."
    else 
        echo "Installing Git is SUCCESS."
    fi
fi