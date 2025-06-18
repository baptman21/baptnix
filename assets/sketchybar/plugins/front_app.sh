#!/bin/sh

ICON_PADDING_RIGHT=5
alias sketchybar=@SKETCHYBAR_BIN_PATH@

case $INFO in
"Calendar")
    ICON_PADDING_RIGHT=3
    ICON=
    ;;
"Slack")
    ICON=
    ;;
"Finder")
    ICON=󰀶
    ;;
"Google Chrome")
    ICON_PADDING_RIGHT=7
    ICON=
    ;;
"Alacritty")
    ICON=󰄛
    ;;
"alacritty")
    ICON=󰄛
    ;;
"Notion")
    ICON_PADDING_RIGHT=6
    ICON=󰎚
    ;;
*)
    ICON_PADDING_RIGHT=2
    ICON=
    ;;
esac

sketchybar --set $NAME icon=$ICON icon.padding_right=$ICON_PADDING_RIGHT
sketchybar --set $NAME.name label="$INFO"
