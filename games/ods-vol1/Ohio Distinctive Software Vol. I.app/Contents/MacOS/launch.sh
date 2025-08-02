#!/bin/bash
NAME="Ohio Distinctive Software Vol. I"
APPDIR="$(cd "$(dirname "$0")/.." && pwd)"
RESOURCES="$APPDIR/Resources"
GAMEDATA="$HOME/Library/Application Support/$NAME"
CONF_TMP="/tmp/dosbox_x_conf_$$.conf"

mkdir -p "$GAMEDATA"
mkdir -p "$GAMEDATA/win311qt"

if [ ! -f "$GAMEDATA/AUTORUN.BAT" ]; then
  cp -R "$RESOURCES/GAMEDATA/"* "$GAMEDATA/"
fi

if [ ! -f "$GAMEDATA/win311qt/runapp.bat" ]; then
  cp -R "$RESOURCES/win311qt/"* "$GAMEDATA/win311qt/"
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
MOUNT D "$GAMEDATA/win311qt"
C:
AUTORUN.BAT
EOF

"$APPDIR/MacOS/dosbox-x" -conf "$CONF_TMP"
