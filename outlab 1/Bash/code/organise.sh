#!/bin/bash

# cat mock_grading/roll_list
# echo "$value"
mkdir organised
cd organised
while read line;
do
    mkdir "$line"
    str="$line"
    declare -i len=${#str}
    for file in ../mock_grading/submissions/*
    do
        roll=${file:28:len}
        name=${file:28}
        if [ "$roll" = "$line" ]
        then
            cd "$line"
            ln -s "../$file" "$name"
            cd ..
        fi
    done
done < ../mock_grading/roll_list