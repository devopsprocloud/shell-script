#!/bin/bash

source_dir=""
action=""
destination_dir=""
time="14"
memory=""

R="\e[91m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m"

USAGE (){
    echo -e "USAGE:: $(basename $0) -s <source-dir> -a <action archive|delete> -d <destination-dir> -t <days> -m <memory-in-mb>"
    echo -e "Options::"
    echo -e "  -s, specify the source directory (mandotory)"
    echo -e "  -a, specify action: archive or delete (mandotory)"
    echo -e "  -d, specify the destination directory if -a is "archive". This is optional when -a is "delete""
    echo -e "  -t, specify the number of dates (Optiona). default value is 14 days"
    echo -e "  -m, specify the memory in mb (Optiona)"
    echo -e "  -h, display this help and exit" 
}

if [ $# -eq 0 ]; 
then
    echo -e "$R ERROR:: Please provide the options, find the below usage$N"
    USAGE
    exit
fi

while getopts ":s:a:d:t:m:h" opt;
do 
    case $opt in
        s) source_dir="$OPTARG";;
        a) action="$OPTARG";;
        d) destination_dir="$OPTARG";;
        t) time="$OPTARG";;
        m) memory="$OPTARG";;
        h) USAGE; exit;;
        \?) echo "ERROR: Invalid Option: -$OPTARG"; USAGE; exit;;
    esac
done

#-------------------------------------------------------------------

if [ ! -d $source_dir ]; # ! denotes 
then
    echo -e "ERROR: The source directory $source_dir does not exist. Please enter a valid directory directory"
    USAGE
    exit 1
fi 

if [ -z "$(ls -A "$source_dir")" ];  # Check if the source directory has files or not
then
    echo -e "$R ERROR::$N The source directory $Y$source_dir$N is Empty."
    exit 1
fi

#-------------------------------------------------------------------

if [ -z "$source_dir" ] || [ -z "$action" ]; # -z denotes empty
then    
    echo -e "$R ERROR:: -s, and -a, options are mandotory $N"
    USAGE
    exit 1
fi 

#--------------------------------------------------------------------

if [ "$action" == "archive" ] && [ -z "$destination_dir" ] ;
then 
    echo -e "$R ERROR:: -d, is mandotory when -a, is archive $N"
    USAGE
    exit 1
fi

if [ "$action" == "archive" ] && [ ! -d $destination_dir ]
then
    echo -e "$R ERROR::$N The destination directory $Y$destination_dir$N does not exist. Please enter a valid directory directory"
    USAGE
    exit 1
fi

#--------------------------------------------------------------------------------

if [ "$action" == "delete" ];
then
    FILES_TO_DELETE=$(find $source_dir -type f -mtime "+$time" -name "*.log") # +$time is important

    while IFS= read -r line # looping the files to delete and reading them line by line
    do 
        echo -e "$Y Deleting:$N $B$line$N"
        rm -rf $line
    done <<< $FILES_TO_DELETE
else
    FILES_TO_ARCHIVE=$(find $source_dir -type f -mtime "+$time" -name "*.log")

    while IFS= read -r line # looping the files to delete and reading them line by line 
    do 
        echo -e "$G ARCHIVING:$N $B$line$N"
        zip -r "$destination_dir/archive.zip" $line
    done <<< $FILES_TO_ARCHIVE
fi


