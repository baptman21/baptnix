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
# Hyprland
{
  config = {
    programs.kitty.enable = true; # Full config in kitty.nix
    wayland.windowManager.hyprland = {
      enable = true; # enable Hyprland
      extraConfig = ''
        exec-once=swaybg -i ${background_image}
        # exec-once=wlsunset -l -23 -L -46
        # exec-once=eww daemon
        # exec-once=eww open bar
        # exec-once=dunst

        general {
            gaps_in=6
            gaps_out=12
            border_size=4
            col.active_border=0xffb072d1
            col.inactive_border=0xff292a37
        }

        monitor=,1920x1080,auto,1,bitdepth,8
        monitor=,preferred,auto,1,mirror,eDP-1,bitdepth,8

        xwayland {
          force_zero_scaling = true
        }

        bind=$mod,Return,exec,kitty
        bind=$mod_SHIFT,Q,killactive,
        bind=$mod,Space,togglefloating,
        bind=$mod,D,exec,wofi --show run --xoffset=1670 --yoffset=12 --width=230px --height=984 --style=$HOME/.config/wofi.css --term=kitty --prompt=Run
        bind=$mod,F,fullscreen,0

        bind=$mod,h,movefocus,l
        bind=$mod,l,movefocus,r
        bind=$mod,k,movefocus,u
        bind=$mod,j,movefocus,d

        bind=$mod_SHIFT,h,movewindow,l
        bind=$mod_SHIFT,l,movewindow,r
        bind=$mod_SHIFT,k,movewindow,u
        bind=$mod_SHIFT,j,movewindow,d

        bind=$mod,1,workspace,1
        bind=$mod,2,workspace,2
        bind=$mod,3,workspace,3
        bind=$mod,4,workspace,4
        bind=$mod,5,workspace,5
        bind=$mod,6,workspace,6
        bind=$mod,7,workspace,7
        bind=$mod,8,workspace,8
        bind=$mod,9,workspace,9
        bind=$mod,0,workspace,0

        bind=$mod_SHIFT,1,movetoworkspacesilent,1
        bind=$mod_SHIFT,2,movetoworkspacesilent,2
        bind=$mod_SHIFT,3,movetoworkspacesilent,3
        bind=$mod_SHIFT,4,movetoworkspacesilent,4
        bind=$mod_SHIFT,5,movetoworkspacesilent,5
        bind=$mod_SHIFT,6,movetoworkspacesilent,6
        bind=$mod_SHIFT,7,movetoworkspacesilent,7
        bind=$mod_SHIFT,8,movetoworkspacesilent,8
        bind=$mod_SHIFT,9,movetoworkspacesilent,9
        bind=$mod_SHIFT,0,movetoworkspacesilent,0

        bind=,XF86MonBrightnessUp,exec,brightnessctl set +5%
        bind=,XF86MonBrightnessDown,exec,brightnessctl set 5%-
        bind=,XF86AudioRaiseVolume,exec,pamixer -i 5
        bind=,XF86AudioLowerVolume,exec,pamixer -d 5
      '';
      settings = {
        "$mod" = modifier;
        # bind = [ "$mod, F, exec, firefox" ", Print, exec, grimblast copy area" ]
        #   ++ (
        #     # workspaces
        #     # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
        #     builtins.concatLists (builtins.genList (i:
        #       let ws = i + 1;
        #       in [
        #         "$mod, code:1${toString i}, workspace, ${toString ws}"
        #         "$mod SHIFT, code:1${toString i}, movetoworkspace, ${
        #           toString ws
        #         }"
        #       ]) 9));
      };
    };
  };
}
