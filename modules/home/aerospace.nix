{ config, pkgs, inputs, ... }:
let
  choose-launcher =
    import ../../pkgs/darwin/choose_launcher.nix { inherit pkgs; };
  terminal = import ../../pkgs/darwin/terminal.nix { inherit pkgs; };
in {
  services.jankyborders = { enable = true; };

  programs.aerospace = {
    enable = true;
    userSettings = {
      start-at-login = true;

      on-focused-monitor-changed = [ "move-mouse monitor-lazy-center" ];

      after-startup-command = [
        # JankyBorders has a built-in detection of already running process,
        # so it won't be run twice on AeroSpace restart
        "exec-and-forget ${pkgs.jankyborders}/bin/borders active_color=0xffe1e3e4 inactive_color=0xff494d64 width=50.0"
      ];
      gaps = {
        inner.horizontal = 20;
        inner.vertical = 20;
        outer.left = [ { monitor."built-in" = 4; } 30 ];
        outer.top = [ { monitor."built-in" = 4; } 30 ];
        outer.bottom = [ { monitor."built-in" = 4; } 30 ];
        outer.right = [ { monitor."built-in" = 4; } 30 ];
      };

      mode.main.binding = {
        # See: https://nikitabobko.github.io/AeroSpace/goodies#open-a-new-window-with-applescript
        alt-enter = "exec-and-forget ${terminal}/bin/terminal.sh";
        alt-d = "exec-and-forget ${choose-launcher}/bin/choose-launcher.sh";

        # i3 wraps focus by default
        alt-j = "focus --boundaries-action wrap-around-the-workspace left";
        alt-k = "focus --boundaries-action wrap-around-the-workspace down";
        alt-l = "focus --boundaries-action wrap-around-the-workspace up";
        alt-semicolon =
          "focus --boundaries-action wrap-around-the-workspace right";

        alt-shift-j = "move left";
        alt-shift-k = "move down";
        alt-shift-l = "move up";
        alt-shift-semicolon = "move right";

        # Consider using "join-with" command as a "split" replacement if you want to enable
        # normalizations
        alt-h = "join-with down";
        alt-v = "join-with right";

        alt-f = "fullscreen";
        shift-alt-f = "fullscreen";

        alt-s = "layout v_accordion"; # "layout stacking" in i3
        alt-w = "layout h_accordion"; # "layout tabbed" in i3
        alt-e =
          "layout tiles horizontal vertical"; # "layout toggle split" in i3

        alt-shift-space = "layout floating tiling"; # "floating toggle" in i3

        # Not supported, because this command is redundant in AeroSpace mental model.
        # See: https://nikitabobko.github.io/AeroSpace/guide#floating-windows
        #alt-space = "focus toggle_tiling_floating"

        # `focus parent`/`focus child` are not yet supported, and it"s not clear whether they
        # should be supported at all https://github.com/nikitabobko/AeroSpace/issues/5
        # alt-a = "focus parent"

        alt-1 = "workspace 1";
        alt-2 = "workspace 2";
        alt-3 = "workspace 3";
        alt-4 = "workspace 4";
        alt-5 = "workspace 5";
        alt-6 = "workspace 6";
        alt-7 = "workspace 7";
        alt-8 = "workspace 8";
        alt-9 = "workspace 9";
        alt-0 = "workspace 10";

        alt-shift-1 = "move-node-to-workspace 1";
        alt-shift-2 = "move-node-to-workspace 2";
        alt-shift-3 = "move-node-to-workspace 3";
        alt-shift-4 = "move-node-to-workspace 4";
        alt-shift-5 = "move-node-to-workspace 5";
        alt-shift-6 = "move-node-to-workspace 6";
        alt-shift-7 = "move-node-to-workspace 7";
        alt-shift-8 = "move-node-to-workspace 8";
        alt-shift-9 = "move-node-to-workspace 9";
        alt-shift-0 = "move-node-to-workspace 10";

        ctrl-alt-z = "move-workspace-to-monitor --wrap-around prev";
        ctrl-alt-c = "move-workspace-to-monitor --wrap-around next";

        alt-shift-c = "reload-config";

        alt-r = "mode resize";
      };

      mode.resize.binding = {
        h = "resize width -50";
        j = "resize height +50";
        k = "resize height -50";
        l = "resize width +50";
        enter = "mode main";
        esc = "mode main";
      };
      on-window-detected = [{
        "if".app-id = "com.tinyspeck.slackmacgap";
        "run" = "move-node-to-workspace 7";
      }];
    };
  };
}
