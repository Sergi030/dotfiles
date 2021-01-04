#!/bin/bash

nmcli dev status | awk '{print $2}' | grep -q "wifi"
if [ $? -eq 0 ] # Show output only if there is any wifi card
then
    if [[ -z "$(iwgetid -r)" ]];then
        echo "Disconnected "
    else
        echo "$(iwgetid -r) "
    fi
fi

