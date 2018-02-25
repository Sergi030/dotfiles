#!/bin/bash

TODO_FILE=~/tmp/rofi_todos

if [[ ! -a "${TODO_FILE}" ]]; then
    touch "${TODO_FILE}"
fi

function list_todos()
{
    TODO=$(cat "${TODO_FILE}")
    if [[ -z "${TODO}" ]]; then
        TODDO="\n"
    fi
    echo "${TODO}"
}

if [ -z "$@" ]
then
    list_todos
else
    TODO=$(echo "${@}" | sed "s/\([^a-zA-Z0-9]\)/\\\\\\1/g")
    TODO_UNSCAPED=${@}

    MATCHING=$(grep "^${TODO}$" "${TODO_FILE}")
    if [[ -n "${MATCHING}" ]]; then
        #sed -i "/^${TODO}$/d" "${TODO_FILE}"
	gnome-terminal -x sh -c 'ls_ssh_gw_tunnel ${MATCHING}; exec bash'	
    else
        echo -e "${TODO_UNSCAPED}" >> "${TODO_FILE}"
	gnome-terminal -x sh -c 'ls_ssh_gw_tunnel ${MATCHING} exec bash'	
    fi
    list_todos
fi

sort -r ${TODO_FILE} -o ${TODO_FILE}
