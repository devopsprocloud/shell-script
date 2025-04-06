#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

file="/etc/passwd"

if [ ! -f $file ]
then
    echo -e "$R The file $file does not exist $N"
fi

while IFS=":" read username passwd shell
do
    echo -e "username is: $G $username $N"
    echo -e "password is: $G $passwd $N"
    echo -e "shell is: $G $shell $N"
done < $file