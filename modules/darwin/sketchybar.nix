{ config, pkgs, ... }:
# Sketchybar config for darwin
{
  config = {
    services.sketchybar = {
      enable = true;
      config = ''
        # Define colors
        export COLOR_BLACK="0x272537"
        export COLOR_WHITE="0xe8e6e9"

        # Configure bar
        sketchybar --bar height=32 \
                        position=top \
                        padding_left=10 \
                        padding_right=10 \
                        color=$COLOR_BLACK

        # Configure default values
        sketchybar --default icon.font="SF Pro:Bold:14.0" \
                            icon.color=$COLOR_WHITE \
                            label.font="SF Pro:Bold:14.0" \
                            label.color=$COLOR_WHITE

        # Add items to the bar
        sketchybar --add item clock right \
                  --set clock script="date '+%H:%M'" \
                              update_freq=10

        # Update the bar
        sketchybar --update
      '';
    };
  };
}
