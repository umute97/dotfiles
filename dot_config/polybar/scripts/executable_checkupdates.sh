#!/usr/bin/bash

# Query number of packages to be updated
# Requires systemd services and timers to be set up
if [ -s /var/local/countupdates/count ] ; then
    count=$(cat /var/local/countupdates/count)
else
    count=0
fi

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