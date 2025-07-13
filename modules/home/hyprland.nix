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

        input {
            # follow_mouse=0
        }

        general {
            sensitivity=1
            main_mod=${modifier}

            gaps_in=6
            gaps_out=12
            border_size=4
            col.active_border=0xffb072d1
            col.inactive_border=0xff292a37

            damage_tracking=full
        }

        decoration {
            rounding=8
            blur=0
            drop_shadow=0
            shadow_range=60
            col.shadow=0x66000000
        }

        animations {
            enabled=1
            animation=windows,1,4,default,slide
            animation=borders,1,5,default
            animation=fadein,1,5,default
            animation=workspaces,1,3,default,vertslide
        }

        dwindle {
            pseudotile=0 # enable pseudotiling on dwindle
        }

        # example window rules
        # for windows named/classed as abc and xyz
        windowrule=float,move 0 0,pqiv
        windowrule=float,foot-notes
        #windowrule=size 420 69,abc
        #windowrule=tile,xyz
        #windowrule=float,abc
        #windowrule=pseudo,abc
        #windowrule=monitor 0,xyz

        # example binds
        bind=$mod,Return,exec,kitty
        bind=$mod_SHIFT,Q,killactive,
        bind=$mod,V,togglefloating,
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

        bind=ALT,1,workspace,1
        bind=ALT,2,workspace,2
        bind=ALT,3,workspace,3
        bind=ALT,4,workspace,4
        bind=ALT,5,workspace,5

        bind=$mod_SHIFT,exclam,movetoworkspacesilent,1
        bind=$mod_SHIFT,at,movetoworkspacesilent,2
        bind=$mod_SHIFT,numbersign,movetoworkspacesilent,3
        bind=$mod_SHIFT,dollar,movetoworkspacesilent,4
        bind=$mod_SHIFT,percent,movetoworkspacesilent,5

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
