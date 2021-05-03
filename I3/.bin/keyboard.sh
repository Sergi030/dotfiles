#!/bin/bash

lang=$(setxkbmap -query | grep layout: | awk '{print $2}')

if [ $lang == 'en' ]
then
    setxkbmap es
    dunstify -a 'Keyboard' -r 2593 -u normal "ES"
elif [ $lang == 'es' ]  
then
    setxkbmap us
    dunstify -a 'Keyboard' -r 2593 -u normal "US"
else 
    setxkbmap es
    dunstify -a 'Keyboard' -r 2593 -u normal "ES"
fi  
