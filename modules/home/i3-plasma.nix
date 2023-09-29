{ modifier, background_image }:
# I3 configuration
#
# Args:
# - modifier: i3 modifier
# - background_image: background image
#
let
  colors = {
    primary = "#11d116";
  };
in
{ config, pkgs, ... }:
# I3 configuration to use with KDE
{

  home.packages = [
    pkgs.milou # not installed by default and needed so that krunner does not crash
    pkgs.i3lock-fancy
  ];
  # Files to include in the home
  home.file.".background-image" = {
    source = background_image;
  };
  # We add this file to disable the systemBoot option to allow i3 to replace
  # KNWM
  home.file.".config/startkderc" = {
    source = ../../assets/config/kde/i3-plasma/startkderc;
  };

  xsession.enable = false;

  # Disable the command set by the i3 service of home manager
  # xsession.windowManager.command = pkgs.lib.mkForce ''test -n "$1" && eval "$@"'';

  xsession.windowManager.i3 = {
    enable = true;
    config = {
      colors = {
        focused = { border = "#01010177"; childBorder = "#01010177"; background = "#313B40"; text = "${colors.primary}"; indicator = "${colors.primary}"; };
        focusedInactive = { border = "#01010177"; childBorder = "#01010177"; background = "#212B30"; text = "#C4C7C5"; indicator = "#454948"; };
        unfocused = { border = "#01010177"; childBorder = "#01010177"; background = "#212B30"; text = "#C4C7C5"; indicator = "#454948"; };
        urgent = { border = "#01010177"; childBorder = "#01010177"; background = "#212B30"; text = "#EC7875"; indicator = "#268BD2"; };
        placeholder = { border = "#00000077"; childBorder = "#000000"; background = "#0c0c0c"; text = "#ffffff"; indicator = "#000000"; };

        background = "#000000";
      };

      inherit modifier;

      window.titlebar = false;
      floating.border = 1;

      gaps = {
        inner = 14;
        outer = -2;
        smartBorders = "on";
      };

      assigns = {
        "6" = [{ class = "^Spotify$"; }];
        "7" = [{ class = "^Slack$"; }];
        "8" = [{ class = "^discord$"; }];
      };

      keybindings = pkgs.lib.mkOptionDefault {
        "${modifier}+u" = "border none";
        "${modifier}+n" = "border pixel 1";

        "${modifier}+Return" = "exec konsole";
        "${modifier}+Shift+q" = "kill";
        "${modifier}+z" = "exec --no-startup-id morc_menu";
        "${modifier}+shift+m" = "exec i3lock-fancy -p -t 'Well have you noticed the shields are still up ?!'";
        "${modifier}+t" = "exec --no-startup-id pkill picom ";
        "${modifier}+Ctrl+t" = "exec --no-startup-id picom --experimental-backends -b";
        "${modifier}+Ctrl+y" = "exec --no-startup-id systemctl --user restart polybar";
        "${modifier}+Ctrl+c" = "exec --no-startup-id conky -d -q";
        "${modifier}+Shift+e" = "exec qdbus org.kde.ksmserver /KSMServer org.kde.KSMServerInterface.logout -1 -1 -1";

        "${modifier}+ctrl+r" = "move workspace to output left";
        "${modifier}+j" = "focus left";
        "${modifier}+k" = "focus down";
        "${modifier}+l" = "focus up";
        "${modifier}+semicolon" = "focus right";
        "${modifier}+Left" = "focus left";
        "${modifier}+Down" = "focus down";
        "${modifier}+Up" = "focus up";
        "${modifier}+Right" = "focus right";
        "${modifier}+Shift+j" = "move left";
        "${modifier}+Shift+k" = "move down";
        "${modifier}+Shift+l" = "move up";
        "${modifier}+Shift+semicolon" = "move right";
        "${modifier}+Shift+Left" = "move left";
        "${modifier}+Shift+Down" = "move down";
        "${modifier}+Shift+Up" = "move up";
        "${modifier}+Shift+Right" = "move right";
        "${modifier}+b" = "workspace back_and_forth";
        "${modifier}+Shift+b" = "move container to workspace back_and_forth; workspace back_and_forth";
        "${modifier}+h" = "split h;exec notify-send 'tile horizontally'";
        "${modifier}+v" = "split v;exec notify-send 'tile vertically'";
        "${modifier}+q" = "split toggle";
        "${modifier}+f" = "fullscreen toggle";
        "${modifier}+s" = "layout stacking";
        "${modifier}+w" = "layout tabbed";
        "${modifier}+e" = "layout toggle split";
        "${modifier}+Shift+space" = "floating toggle";
        "${modifier}+space" = "focus mode_toggle";
        "${modifier}+Shift+s" = "sticky toggle";
        "${modifier}+a" = "focus parent";
        "${modifier}+Shift+a" = "focus child";
        "${modifier}+Shift+minus" = "move scratchpad";
        "${modifier}+minus" = "scratchpad show";
        "${modifier}+Ctrl+Right" = "workspace next";
        "${modifier}+Ctrl+Left" = "workspace prev";
        "${modifier}+1" = "workspace 1";
        "${modifier}+2" = "workspace 2";
        "${modifier}+3" = "workspace 3";
        "${modifier}+4" = "workspace 4";
        "${modifier}+5" = "workspace 5";
        "${modifier}+6" = "workspace 6";
        "${modifier}+7" = "workspace 7";
        "${modifier}+8" = "workspace 8";
        "${modifier}+Ctrl+1" = "move container to workspace 1";
        "${modifier}+Ctrl+2" = "move container to workspace 2";
        "${modifier}+Ctrl+3" = "move container to workspace 3";
        "${modifier}+Ctrl+4" = "move container to workspace 4";
        "${modifier}+Ctrl+5" = "move container to workspace 5";
        "${modifier}+Ctrl+6" = "move container to workspace 6";
        "${modifier}+Ctrl+7" = "move container to workspace 7";
        "${modifier}+Ctrl+8" = "move container to workspace 8";
        "${modifier}+Shift+1" = "move container to workspace 1; workspace 1";
        "${modifier}+Shift+2" = "move container to workspace 2; workspace 2";
        "${modifier}+Shift+3" = "move container to workspace 3; workspace 3";
        "${modifier}+Shift+4" = "move container to workspace 4; workspace 4";
        "${modifier}+Shift+5" = "move container to workspace 5; workspace 5";
        "${modifier}+Shift+6" = "move container to workspace 6; workspace 6";
        "${modifier}+Shift+7" = "move container to workspace 7; workspace 7";
        "${modifier}+Shift+8" = "move container to workspace 8; workspace 8";
        "${modifier}+Shift+c" = "reload";
        "${modifier}+Shift+r" = "restart";
        "${modifier}+r" = ''mode "resize"'';
      };
      menu = "${pkgs.plasma-workspace}/bin/krunner";

      defaultWorkspace = "workspace 1";

      startup = [
        {
          command = "${pkgs.feh}/bin/feh --bg-scale ${background_image}";
          always = true;
          notification = false;
        }
        {
          command = "systemctl --user restart polybar";
          always = true;
          notification = false;
        }
        {
          command = ''pkill "ksplashqml"'';
          always = true;
          notification = false;
        }
      ];

      bars = [ ];

      terminal = "konsole";

    };

    extraConfig = ''
      #########################################################################
      ## Plasma windows configurations                                       ##
      #########################################################################
      for_window [class="Galculator"] floating enable border pixel 1
      for_window [class="spectacle"] floating enable border pixel 1
      for_window [class="plasmawindowed"] floating enable border pixel 1
      for_window [class="GParted"] floating enable border pixel 1
      for_window [title="i3_help"] floating enable sticky enable border pixel 1
      for_window [class="Manjaro-hello"] floating enable
      for_window [class="Manjaro Settings Manager"] floating enable border pixel 1
      for_window [class="Nitrogen"] floating enable sticky enable border pixel 1
      for_window [class="qt5ct"] floating enable sticky enable border pixel 1
      for_window [class="Qtconfig-qt4"] floating enable sticky enable border pixel 1
      for_window [class="Simple-scan"] floating enable border pixel 1

      for_window [window_role="pop-up"] floating enable
      for_window [window_role="task_dialog"] floating enable

      for_window [class="yakuake"] floating enable
      for_window [class="systemsettings"] floating enable
      for_window [class="plasmashell"] floating enable;
      for_window [class="Plasma"] floating enable; border none
      for_window [class="Conky"] floating enable; border none
      for_window [title="plasma-desktop"] floating enable; border none
      for_window [title="win7"] floating enable; border none
      for_window [class="krunner"] floating enable; border none, move down 100px
      for_window [class="Kmix"] floating enable; border none
      for_window [class="Klipper"] floating enable; border none
      for_window [class="Plasmoidviewer"] floating enable; border none
      for_window [class="(?i)*nextcloud*"] floating disable
      for_window [class="plasmashell" window_type="notification"] border none, move right 700px, move down 450px
      for_window [class="plasmashell" window_type="dialog"] floating enable, border pixel 1, resize set 400 300
      no_focus [class="plasmashell" window_type="notification"]
      no_focus [class="plasmashell" window_type="on_screen_display"]

      for_window [title="^Desktop .*— Plasma$"] kill; floating enable; border none
      for_window [class="ksplashqml"] kill; border pixel 1
    '';
  };
}
