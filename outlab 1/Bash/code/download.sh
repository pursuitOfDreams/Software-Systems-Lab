#!/bin/bash

if [ "$#" -ne 2 ];
then
    echo "Usage: bash download.sh <link to directory> <cut-dirs argument>"
    exit 1
    fi
dir_name=${1?Usage: bash download.sh <link to directory> <cut-dirs argument>}
cut_ds=${2?Usage: bash download.sh <link to directory> <cut-dirs argument>}
cut_ds=$(($cut_ds+1))

# wget -q -r -np -nH -R "index.html*" https://www.cse.iitb.ac.in/~vahanwala/ssl21/mock_grading/ -P mock_grading --cut-dirs=3
wget -q -r -np -nH -R "index.html*" -R "*.tmp" "$dir_name" -P mock_grading --cut-dirs=$cut_ds
