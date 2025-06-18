{ config, pkgs, ... }:
# Yabai config with skhd for i3 like feel
let
  choose-launcher =
    import ../../pkgs/darwin/choose_launcher.nix { inherit pkgs; };
  terminal = import ../../pkgs/darwin/terminal.nix { inherit pkgs; };
in {
  config = {
    services.yabai.enable = true;
    services.yabai.enableScriptingAddition = true;
    services.yabai.extraConfig = ''
      yabai -m config mouse_follows_focus          on
      yabai -m config focus_follows_mouse          on

      yabai -m config window_placement             first_child
      yabai -m config window_topmost               off
      yabai -m config window_opacity               off
      yabai -m config window_opacity_duration      0.0
      yabai -m config window_shadow                on
      yabai -m config window_border                off
      yabai -m config window_border_width          4
      yabai -m config active_window_border_color   0xff775759
      yabai -m config normal_window_border_color   0xff505050
      yabai -m config insert_window_border_color   0xffd75f5f
      yabai -m config active_window_opacity        1.0
      yabai -m config normal_window_opacity        0.90
      yabai -m config split_ratio                  0.50
      yabai -m config auto_balance                 off
      yabai -m config mouse_modifier               fn
      yabai -m config mouse_action1                move
      yabai -m config mouse_action2                resize

      yabai -m config layout                       bsp
      yabai -m config top_padding                  38
      yabai -m config bottom_padding               20
      yabai -m config left_padding                 20
      yabai -m config right_padding                20
      yabai -m config window_gap                   10

      yabai -m rule --add app="choose" manage=off
      yabai -m rule --add label="Finder" app="^Finder$" title="(Co(py|nnect)|Move|Info|Pref)" manage=off
      yabai -m rule --add label="macfeh" app="^macfeh$" manage=off
      yabai -m rule --add label="System Preferences" app="^System Preferences$" title=".*" manage=off
      yabai -m rule --add label="App Store" app="^App Store$" manage=off
      yabai -m rule --add label="Activity Monitor" app="^Activity Monitor$" manage=off
      yabai -m rule --add label="KeePassXC" app="^KeePassXC$" manage=off
      yabai -m rule --add label="Calculator" app="^Calculator$" manage=off
      yabai -m rule --add label="Dictionary" app="^Dictionary$" manage=off
      yabai -m rule --add label="mpv" app="^mpv$" manage=off
      yabai -m rule --add label="Software Update" title="Software Update" manage=off
      yabai -m rule --add label="About This Mac" app="System Information" title="About This Mac" manage=off

      function setup_space {
        local idx="$1"
        local name="$2"
        local space=
        echo "setup space $idx : $name"

        space=$(yabai -m query --spaces --space "$idx")
        if [ -z "$space" ]; then
          yabai -m space --create
        fi
        if [ "$name" != "unnamed" ]; then
          yabai -m space "$idx" --label "$name"
        fi
      }

      setup_space 1 code
      setup_space 2 web
      setup_space 3 unnamed
      setup_space 4 unnamed
      setup_space 5 unnamed
      setup_space 6 unnamed
      setup_space 7 slack
      setup_space 8 unnamed
      setup_space 9 unnamed
      setup_space 10 unnamed

      # move some apps automatically to specific spaces
      yabai -m rule --add app="^Firefox$" space=2
      yabai -m rule --add app="^Slack$" space=7
    '';

    services.skhd.enable = true;
    services.skhd.skhdConfig = ''
      # focus window
      alt - h : yabai -m window --focus west
      alt - j : yabai -m window --focus south
      alt - k : yabai -m window --focus north
      alt - l : yabai -m window --focus east

      # swap window
      shift + alt - h : yabai -m window --swap west
      shift + alt - j : yabai -m window --swap south
      shift + alt - k : yabai -m window --swap north
      shift + alt - l : yabai -m window --swap east

      # move window
      shift + cmd - h : yabai -m window --warp west
      shift + cmd - j : yabai -m window --warp south
      shift + cmd - k : yabai -m window --warp north
      shift + cmd - l : yabai -m window --warp east

      # balance size of windows
      shift + alt - 0 : yabai -m space --balance

      # make floating window fill screen
      shift + alt - up     : yabai -m window --grid 1:1:0:0:1:1

      # make floating window fill left-half of screen
      shift + alt - left   : yabai -m window --grid 1:2:0:0:1:1

      # make floating window fill right-half of screen
      shift + alt - right  : yabai -m window --grid 1:2:1:0:1:1

      # destroy desktop
      cmd + alt - w : yabai -m space --destroy

      # fast focus desktop
      cmd + alt - x : yabai -m space --focus recent
      cmd + alt - z : yabai -m space --focus prev
      cmd + alt - c : yabai -m space --focus next
      alt - 1 : yabai -m space --focus 1
      alt - 2 : yabai -m space --focus 2
      alt - 3 : yabai -m space --focus 3
      alt - 4 : yabai -m space --focus 4
      alt - 5 : yabai -m space --focus 5
      alt - 6 : yabai -m space --focus 6
      alt - 7 : yabai -m space --focus 7
      alt - 8 : yabai -m space --focus 8
      alt - 9 : yabai -m space --focus 9
      alt - 0 : yabai -m space --focus 10

      # send window to desktop and follow focus
      shift + alt - x : yabai -m window --space recent; yabai -m space --focus recent
      shift + alt - z : yabai -m window --space prev; yabai -m space --focus prev
      shift + alt - c : yabai -m window --space next; yabai -m space --focus next
      shift + alt - 1 : yabai -m window --space  1; yabai -m space --focus 1
      shift + alt - 2 : yabai -m window --space  2; yabai -m space --focus 2
      shift + alt - 3 : yabai -m window --space  3; yabai -m space --focus 3
      shift + alt - 4 : yabai -m window --space  4; yabai -m space --focus 4
      shift + alt - 5 : yabai -m window --space  5; yabai -m space --focus 5
      shift + alt - 6 : yabai -m window --space  6; yabai -m space --focus 6
      shift + alt - 7 : yabai -m window --space  7; yabai -m space --focus 7
      shift + alt - 8 : yabai -m window --space  8; yabai -m space --focus 8
      shift + alt - 9 : yabai -m window --space  9; yabai -m space --focus 9
      shift + alt - 0 : yabai -m window --space 10; yabai -m space --focus 10

      # focus monitor
      ctrl + alt - x  : yabai -m display --focus recent
      ctrl + alt - z  : yabai -m display --focus prev
      ctrl + alt - c  : yabai -m display --focus next
      ctrl + alt - 1  : yabai -m display --focus 1
      ctrl + alt - 2  : yabai -m display --focus 2
      ctrl + alt - 3  : yabai -m display --focus 3

      # increase window size
      shift + alt - a : yabai -m window --resize left:-20:0
      shift + alt - s : yabai -m window --resize bottom:0:20
      shift + alt - w : yabai -m window --resize top:0:-20
      shift + alt - d : yabai -m window --resize right:20:0

      # Move space to next display
      ctrl + alt - r : yabai -m space --move next

      # rotate tree
      alt - r : yabai -m space --rotate 90

      # mirror tree y-axis
      alt - y : yabai -m space --mirror y-axis

      # mirror tree x-axis
      alt - x : yabai -m space --mirror x-axis

      # toggle desktop offset
      alt - a : yabai -m space --toggle padding; yabai -m space --toggle gap

      # toggle window parent zoom
      alt - q : yabai -m window --toggle zoom-parent

      # toggle window fullscreen zoom
      alt - f : yabai -m window --toggle zoom-fullscreen

      # toggle window native fullscreen
      shift + alt - f : yabai -m window --toggle native-fullscreen

      # toggle window split type
      alt - e : yabai -m window --toggle split

      # float / unfloat window and center on screen
      alt - t : yabai -m window --toggle float;\
                yabai -m window --grid 4:4:1:1:2:2

      # toggle sticky (show on all spaces)
      alt - s : yabai -m window --toggle sticky

      # toggle topmost (keep above other windows)
      alt - o : yabai -m window --toggle topmost

      # toggle sticky, topmost and resize to picture-in-picture size
      alt - p : yabai -m window --toggle sticky;\
                yabai -m window --toggle topmost;\
                yabai -m window --grid 5:5:4:0:1:1

      # change layout of desktop
      ctrl + alt - a : yabai -m space --layout bsp
      ctrl + alt - d : yabai -m space --layout float

      # Custom stuff
      alt - d : ${choose-launcher}/bin/choose-launcher.sh
      cmd - return : ${terminal}/bin/terminal.sh
    '';
  };
}
