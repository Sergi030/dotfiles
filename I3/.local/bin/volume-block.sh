#!/bin/bash

# Acción en función del botón pulsado
case "$BLOCK_BUTTON" in
  1) # Clic central → silenciar / activar
     pamixer --toggle-mute ;;
  2) # Clic central → silenciar / activar
     pamixer --toggle-mute ;;
  3) # Clic central → silenciar / activar
     pamixer --toggle-mute ;;
  4) # Rueda arriba → subir volumen
     pamixer --increase 5 ;;
  5) # Rueda abajo → bajar volumen
     pamixer --decrease 5 ;;
esac

# Consulta del volumen
VOLUME=$(pamixer --get-volume)
MUTED=$(pamixer --get-mute)

if [ "$MUTED" = "true" ]; then
    COLOR="#cc241d"  # rojo estilo Gruvbox
    echo -e "${VOLUME} \n\n$COLOR" 
else
    echo "${VOLUME} " 
fi


