#!/bin/bash
NAME="JumpStart Kindergarten"
APPDIR="$(cd "$(dirname "$0")/.." && pwd)"
RESOURCES="$APPDIR/Resources"
GAMEDATA="$HOME/Library/Application Support/$NAME"
CONF_TMP="/tmp/dosbox_x_conf_$$.conf"

mkdir -p "$GAMEDATA"

if [ ! -f "$GAMEDATA/KG/KG/KGR.EXE" ]; then
  cp -R "$RESOURCES/GAMEDATA/"* "$GAMEDATA/"
fi

cat > "$CONF_TMP" <<EOF
[sdl]
autolock=true
output=opengl

[dosbox]
title=$NAME
memsize=32

[autoexec]
MOUNT C "$GAMEDATA"
C:
CD KG\KG
KGR.EXE
EOF

"$APPDIR/MacOS/dosbox-x" -conf "$CONF_TMP"
