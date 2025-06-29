#!/bin/sh

# FOCUSED_WORKSPACE=$(@AEROSPACE_BIN_PATH@ list-workspaces --focused)

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    @SKETCHYBAR_BIN_PATH@ --set "$NAME" background.drawing=on
else
    @SKETCHYBAR_BIN_PATH@ --set "$NAME" background.drawing=off
fi
