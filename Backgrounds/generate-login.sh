#!/usr/bin/bash

BASE_DIR="$( readlink -f "$(dirname "$0")" )"

if [[ -n "$1" ]]; then
    source_img="$1"
else
    echo "Usage: $0 <source_img>"
    exit 1
fi

echo "Blurring $source_img..."

convert "$source_img" \
    -filter Gaussian \
    -resize 8% \
    -define filter:sigma=1.5 \
    -resize 1920x1080^ \
    -gravity center \
    -extent 1920x1080 \
    "$BASE_DIR/login.png"

echo "Done"
