#!/bin/sh

alias sketchybar=@SKETCHYBAR_BIN_PATH@

sketchybar --set "$NAME" label="$(date '+%a %b %-d %-H:%M')"
