#!/usr/bin/env bash

# Si hay argumentos (por ejemplo: s 10%+), aplicar el cambio
if [[ $# -gt 0 ]]; then
    brightnessctl "$@" > /dev/null 2>&1
fi

LEVEL=$(brightnessctl g)
MAX=$(brightnessctl m)
PERCENT=$(( 100 * LEVEL / MAX ))

echo "${PERCENT}% 


