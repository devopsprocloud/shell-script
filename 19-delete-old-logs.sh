#!/bin/bash

FILES_TO_DELETE=$(find $source_dir -type f -mtime +14 -name "*.log")

echo "Please enter source directory"
read source_dir

if [ ! -d $source_dir ]
then
    echo "Source directory $source_dir does not exist."
else
    while IFS= read -r line 
    do 
        echo "Deleting $line "
        rm -rf $line
    done <<< $FILES_TO_DELETE
fi