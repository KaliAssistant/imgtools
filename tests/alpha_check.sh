#!/bin/bash
# Check if the input path ($1) is provided and is a valid directory
if [[ ! -d "$1" ]]; then
    echo "Error: $1 is not a valid directory."
    exit 1
fi

# Check if the extension ($2) is provided and valid
case "$2" in
    png|heic|tga|jpg|bmp)
        ;;
    *)
        echo "Error: $2 is not a supported extension. Use png, heic, tga, jpg, or bmp."
        exit 1
        ;;
esac

for img in "$1"/*."$2"; do
    if identify -format '%[channels]' "$img" | grep -q 'a'; then
        echo "$img has an alpha channel."
    else
        :;
        #echo "$img does not have an alpha channel."
    fi
done
