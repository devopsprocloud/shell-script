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

while IFS=":" read username passwd user_id group_id user_fullname home_dir shell
do
    echo -e "username is: $G $username $N"
    echo -e "password is: $G $passwd $N"
    echo -e "full name is: $G $user_fullname $N"
    echo -e "group ID is : $G $group_id $N"
    echo -e "shell is: $G $user_id $N"
done < $file