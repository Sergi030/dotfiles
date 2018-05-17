#!/bin/bash

if ! [ -z "$(find /lib/modules/$(uname -r)/kernel/drivers/net/wireless -name '*.ko')" ];then
    if [[ -z "$(iwgetid -r)" ]];then
        echo "Disconnected "
    else
        echo "$(iwgetid -r) "
    fi

fi
