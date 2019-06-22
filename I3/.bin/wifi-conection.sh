#!/bin/bash

if [[ -z "$(iwgetid -r)" ]];then
    echo "Disconnected "
else
    echo "$(iwgetid -r) "
fi

