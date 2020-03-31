#!/usr/bin/bash

count=$(yay -Qu | wc -l)

if [ "$count" -gt 1 ];
then
    echo "$count updates"
else
    if [ "$count" -eq 0 ];
    then
        echo "No update"
    else
        echo "$count update"
    fi
fi