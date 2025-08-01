#!/bin/bash

set -e

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 path/to/image.[jpg|png]"
  exit 1
fi

INPUT_IMAGE="$1"
BASENAME=$(basename "$INPUT_IMAGE")
NAME="${BASENAME%.*}"
ICONSET="${NAME}.iconset"
ICONFILE="${NAME}.icns"

# Create base PNG if needed
echo "Converting input to PNG..."
sips -s format png "$INPUT_IMAGE" --out "${NAME}_base.png"

# Create iconset folder
mkdir -p "$ICONSET"

echo "Generating icon sizes..."
sips -z 16 16     "${NAME}_base.png" --out "$ICONSET/icon_16x16.png"
sips -z 32 32     "${NAME}_base.png" --out "$ICONSET/icon_16x16@2x.png"
sips -z 32 32     "${NAME}_base.png" --out "$ICONSET/icon_32x32.png"
sips -z 64 64     "${NAME}_base.png" --out "$ICONSET/icon_32x32@2x.png"
sips -z 128 128   "${NAME}_base.png" --out "$ICONSET/icon_128x128.png"
sips -z 256 256   "${NAME}_base.png" --out "$ICONSET/icon_128x128@2x.png"
sips -z 256 256   "${NAME}_base.png" --out "$ICONSET/icon_256x256.png"
sips -z 512 512   "${NAME}_base.png" --out "$ICONSET/icon_256x256@2x.png"
cp "${NAME}_base.png" "$ICONSET/icon_512x512.png"
cp "${NAME}_base.png" "$ICONSET/icon_512x512@2x.png"

echo "Packaging into .icns..."
iconutil -c icns "$ICONSET" -o "$ICONFILE"

echo "Cleaning up..."
rm -r "$ICONSET"
rm "${NAME}_base.png"

echo "Done: $ICONFILE"
