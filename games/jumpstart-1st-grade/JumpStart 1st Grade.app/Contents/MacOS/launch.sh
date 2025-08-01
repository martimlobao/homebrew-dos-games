#!/bin/bash
NAME="JumpStart 1st Grade"
APPDIR="$(cd "$(dirname "$0")/.." && pwd)"
RESOURCES="$APPDIR/Resources"
GAMEDATA="$HOME/Library/Application Support/$NAME"
CONF_TMP="/tmp/dosbox_x_conf_$$.conf"

mkdir -p "$GAMEDATA"

if [ ! -f "$GAMEDATA/AUTORUN.BAT" ]; then
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
MOUNT D "$RESOURCES/win311qt"
MOUNT E "$RESOURCES/CDROM"
C:
AUTORUN.BAT
EOF

"$APPDIR/MacOS/dosbox-x" -conf "$CONF_TMP"
