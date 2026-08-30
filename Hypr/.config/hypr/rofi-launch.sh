#!/bin/sh
pkill -x rofi
rm -f /run/user/1000/rofi.pid
rofi -show drun -theme "$HOME/.config/rofi/launchers/type-2/style-1.rasi"
