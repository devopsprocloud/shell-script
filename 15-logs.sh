#!/bin/bash

ID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE=/tmp/$0-$TIMESTAMP.log

VALIDATE() {
    if [ $1 -ne 0 ] #$1 value we have passed in VALIDATE command line
    then 
        echo "$2 is FAILED." #$2 value we have passed in VALIDATE command line
    else 
        echo "I$2 is SUCCESS." #$2 value we have passed in VALIDATE command line
    fi 
}

if [ $ID -ne 0 ]
then 
    echo "Please run this command with root access"
    exit 1
else 
    dnf install git -y &>> $LOGFILE
    VALIDATE $? "Installing GIT is..." 
    #We are passing the arguments for VALIDATE function. Here $?=$1 and "Installing GIT is"=$2

    dnf install mysql -y &>> $LOGFILE
    VALIDATE $? "Installing MySQL is..."
    #We are passing the arguments for VALIDATE function. Here $?=$1 and "Installing MySQL is"=$2
    dnf install nginx -y &>> $LOGFILE
    VALIDATE $? "Installing NGINX is..."
    #We are passing the arguments for VALIDATE function. Here $?=$1 and "Installing NGINX is"=$2
fi 

