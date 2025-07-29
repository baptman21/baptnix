{ background_image, theme }:
# Hyperland config
#
# Args:
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

    services.hyprpolkitagent.enable = true; # auth tool

    services.udiskie = {
      enable = true; # Auto disk mounting (e.g. USB)
      settings = { };
    };

    programs.waybar = {
      enable = true; # Top bar
      systemd = {
        enable = true;
        enableDebug = false;
        enableInspect = false;
      };
      # TODO: make an actual theme for that
      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          height = 30;
          output = [ "eDP-1" "HDMI-A-1" ];
          modules-left = [ "sway/workspaces" "sway/mode" "wlr/taskbar" ];
          modules-center = [ "sway/window" "custom/hello-from-waybar" ];
          modules-right = [ "mpd" "custom/mymodule#with-css-id" "temperature" ];

          "sway/workspaces" = {
            disable-scroll = true;
            all-outputs = true;
          };
          "custom/hello-from-waybar" = {
            format = "hello {}";
            max-length = 40;
            interval = "once";
            exec = pkgs.writeShellScript "hello-from-waybar" ''
              echo "from within waybar"
            '';
          };
        };
      };
    };

    home.packages = [
      pkgs.swaybg # background
      pkgs.hyprpicker # color picker
      pkgs.brightnessctl # brightness control
      pkgs.xfce.thunar # file browser
      pkgs.iwgtk # wifi
      pkgs.blueberry # bluetooth
    ];

    # Clipboard manager
    # TODO: add mapping for opening it with wofi
    services.cliphist = { enable = true; };

    services.hypridle = {
      enable = true;
      settings = {
        general = {
          lock_cmd =
            "pidof hyprlock || hyprlock"; # avoid starting multiple hyprlock instances.
          before_sleep_cmd = "loginctl lock-session"; # lock before suspend.
          after_sleep_cmd =
            "hyprctl dispatch dpms on"; # to avoid having to press a key twice to turn on the display.
        };

        listener = [
          {
            timeout = "150"; # 2.5min.
            on-timeout =
              "brightnessctl -s set 10"; # set monitor backlight to minimum, avoid 0 on OLED monitor.
            on-resume = "brightnessctl -r"; # monitor backlight restore.";
          }

          # turn off keyboard backlight, comment out this section if you dont have a keyboard backlight.
          {
            timeout = "150"; # 2.5min.
            on-timeout =
              "brightnessctl -sd rgb:kbd_backlight set 0"; # turn off keyboard backlight.
            on-resume =
              "brightnessctl -rd rgb:kbd_backlight"; # turn on keyboard backlight.
          }

          {
            timeout = "300"; # 5min
            on-timeout =
              "loginctl lock-session"; # lock screen when timeout has passed
          }

          {
            timeout = "330"; # 5.5min
            on-timeout =
              "hyprctl dispatch dpms off"; # screen off when timeout has passed
            on-resume =
              "hyprctl dispatch dpms on && brightnessctl -r"; # screen on when activity is detected after timeout has fired.
          }

          {
            timeout = "1800"; # 30min
            on-timeout = "systemctl suspend"; # suspend pc
          }
        ];
      };
    };

    programs.hyprlock = {
      enable = true;
      extraConfig = ''
        # sample hyprlock.conf
        # for more configuration options, refer https://wiki.hyprland.org/Hypr-Ecosystem/hyprlock
        #
        # rendered text in all widgets supports pango markup (e.g. <b> or <i> tags)
        # ref. https://wiki.hyprland.org/Hypr-Ecosystem/hyprlock/#general-remarks
        #
        # shortcuts to clear password buffer: ESC, Ctrl+U, Ctrl+Backspace
        #
        # you can get started by copying this config to ~/.config/hypr/hyprlock.conf
        #

        $font = Hack Nerd Font

        general {
            hide_cursor = false
        }

        # uncomment to enable fingerprint authentication
        # auth {
        #     fingerprint {
        #         enabled = true
        #         ready_message = Scan fingerprint to unlock
        #         present_message = Scanning...
        #         retry_delay = 250 # in milliseconds
        #     }
        # }

        animations {
            enabled = true
            bezier = linear, 1, 1, 0, 0
            animation = fadeIn, 1, 5, linear
            animation = fadeOut, 1, 5, linear
            animation = inputFieldDots, 1, 2, linear
        }

        background {
            monitor =
            path = screenshot
            blur_passes = 3
        }

        input-field {
            monitor =
            size = 20%, 5%
            outline_thickness = 3
            inner_color = rgba(0, 0, 0, 0.0) # no fill

            outer_color = rgba(33ccffee) rgba(00ff99ee) 45deg
            check_color = rgba(00ff99ee) rgba(ff6633ee) 120deg
            fail_color = rgba(ff6633ee) rgba(ff0066ee) 40deg

            font_color = rgb(143, 143, 143)
            fade_on_empty = false
            rounding = 15

            font_family = $font
            placeholder_text = Input password...
            fail_text = $PAMFAIL

            # uncomment to use a letter instead of a dot to indicate the typed password
            # dots_text_format = *
            # dots_size = 0.4
            dots_spacing = 0.3

            # uncomment to use an input indicator that does not show the password length (similar to swaylock's input indicator)
            # hide_input = true

            position = 0, -20
            halign = center
            valign = center
        }

        # TIME
        label {
            monitor =
            text = $TIME # ref. https://wiki.hyprland.org/Hypr-Ecosystem/hyprlock/#variable-substitution
            font_size = 90
            font_family = $font

            position = -30, 0
            halign = right
            valign = top
        }

        # DATE
        label {
            monitor =
            text = cmd[update:60000] date +"%A, %d %B %Y" # update every 60 seconds
            font_size = 25
            font_family = $font

            position = -30, -150
            halign = right
            valign = top
        }

        label {
            monitor =
            text = $LAYOUT[en,ru]
            font_size = 24
            onclick = hyprctl switchxkblayout all next

            position = 250, -20
            halign = center
            valign = center
        }
      '';
    };

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
        bind=$mod,D,exec,wofi --show run --xoffset=1670 --yoffset=12 --width=230px --height=984 --term=kitty --prompt=Run
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
        "$mod" = "Mod4"; # Keep a
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
