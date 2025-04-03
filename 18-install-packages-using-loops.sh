#!/bin/bash

ID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

TIMESTAMP=$(date +%F-%H-%H-%S)
LOGFILE=/tmp/$@-$TIMESTAMP.log

echo -e "$Y Script started executing at $TIMESTAMP $N."

VALIDATE() {
    if  [ $1 -ne 0 ]
    then 
        echo -e "$2...$R FAILED $N."
        exit 1
    else
        echo -e "$2...$G SUCCESS $N"
    fi
}

if [ $ID -ne 0 ]
then
    echo -e " $R ERROR $N You are not a root user"
    exit 1
else
    for package in $@ 
    do 
        yum list installed $package &>> $LOGFILE
        if [ $? -ne 0 ] # If not installed
        then
            yum install $package -y &>> $LOGFILE # install the package
            VALIDATE $? "Installing $package" # validate 
        else
            echo -e "$package is already installed...$Y SKIPPING $N." # If installed already give the output
        fi
    done
fi
    