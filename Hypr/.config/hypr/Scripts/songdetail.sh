#!/bin/bash

IMG_LOCK=/tmp/.hyprlock-song-img.jpg
IMG_FOLDER="$HOME/.cache/hyprlock"

rm -f $IMG_LOCK
mkdir -p "$IMG_FOLDER"

# Info de la canción
song_info=$(playerctl metadata --format '{{title}}     {{artist}}')

# URL de la portada
img_url=$(playerctl metadata mpris:artUrl)

# Si no hay portada, termina mostrando solo la info
[ -z "$img_url" ] && {
    echo "$song_info"
    exit 0
}

# Hash para identificar la imagen
img_md5=$(echo -n "$img_url" | md5sum | cut -d' ' -f1)
img_path="$IMG_FOLDER/$img_md5.jpg"

# Descargar solo si no existe ya
if [ ! -f "$img_path" ]; then
    # Quita "file://" si viene en rutas locales
    clean_url="${img_url#file://}"

    # Caso 1: imagen remota
    if [[ "$img_url" == http* ]]; then
        curl -L --silent "$img_url" -o "$img_path"
    else
        # Caso 2: archivo local
        cp "$clean_url" "$img_path"
    fi
fi

echo "$song_info"
echo "Cover saved at: $img_path" 1>&2

cp $img_path $IMG_LOCK
