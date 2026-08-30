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

if [[ -n "$BLOCK_BUTTON" ]]; then
    alacritty -T "__nmtui" --command nmtui-connect 
    exit 0
fi
