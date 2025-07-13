{ modifier, background_image, theme }:
# Hyperland config
#
# Args:
# - modifier: i3 modifier
# - background_image: background image
# - theme: one of tempest, whirlwind
#
let
  colors = {
    tempest = { primary = "#0458cf"; };
    typhoon = { primary = "#a51fff"; };
    whirlwind = { primary = "#11d116"; };
  };
in { config, pkgs, ... }:
# I3 configuration to use with KDE
{
  config = {
    programs.kitty.enable = true; # Full config in kitty.nix
    wayland.windowManager.hyprland = {
      enable = true; # enable Hyprland
      settings = {
        "$mod" = modifier;
        bind = [ "$mod, F, exec, firefox" ", Print, exec, grimblast copy area" ]
          ++ (
            # workspaces
            # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
            builtins.concatLists (builtins.genList (i:
              let ws = i + 1;
              in [
                "$mod, code:1${toString i}, workspace, ${toString ws}"
                "$mod SHIFT, code:1${toString i}, movetoworkspace, ${
                  toString ws
                }"
              ]) 9));
      };
    };
  };
}
