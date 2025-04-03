#!/bin/bash

ID=$(id -u)

# check if the user is a root user or not

if [ $ID -ne 0 ]
then
    echo "You are not a root user."
    exit 1
else
    dnf install mysql -y 
    if [ $? -ne 0 ]
    then
        echo "Installing MySQL is FAILED."
    else
        echo "Installing MySQL is SUCCESS."
    fi
fi 
