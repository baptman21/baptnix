#!/bin/sh

NEON_COLOR=0xFF00FFB1
FG_COLOR=0xFFFFFFFF

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    @SKETCHYBAR_BIN_PATH@ --set "$NAME" icon.color="$NEON_COLOR"
else
    @SKETCHYBAR_BIN_PATH@ --set "$NAME" icon.color="$FG_COLOR"
fi
