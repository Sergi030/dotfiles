#!/bin/bash

lang=$(setxkbmap -query | grep layout: | awk '{print $2}')

if [ $lang == 'en' ]
then
    xkb-switch -s es
    dunstify -a 'Keyboard' -r 2593 -u normal "ES"
elif [ $lang == 'es' ]  
then
    xkb-switch -s us
    dunstify -a 'Keyboard' -r 2593 -u normal "US"
else 
    xkb-switch -s es
    dunstify -a 'Keyboard' -r 2593 -u normal "ES"
fi  
