#!/usr/bin/env bash
echo "$(xbacklight $@ | cut -d '.' -f 1) "
pkill -RTMIN+2 i3blocks
