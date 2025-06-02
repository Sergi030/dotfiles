#!/usr/bin/env bash
xbacklight $@ > /dev/null 2>&1
if [ $? -eq 0  ]
then
    echo "$(xbacklight $@ | cut -d '.' -f 1) "
    pkill -RTMIN+2 i3blocks
fi
