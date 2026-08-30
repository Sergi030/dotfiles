#!/bin/bash

# Mostrar fecha y hora
echo "$(date +'%a %d %b') <b>$(date +'%T')</b>"

# Si se ha hecho clic, lanzar gsimplecal
if [[ -n "$BLOCK_BUTTON" ]]; then
    gsimplecal &
    exit 0
fi

