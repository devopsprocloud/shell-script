#!/bin/bash

ID=$(id -u)

VALIDATE() {
    if [ $? -ne 0 ]
    then 
        echo "Installing GIT is FAILED."
    else 
        echo "Installing GIT is SUCCESS."
    fi 
}

if [ $ID -ne 0 ]
then 
    echo "Please run this command with root access"
    exit 1
else 
    dnf install git -y 
    VALIDATE
    
fi 

