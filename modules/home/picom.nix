{ theme }:
# Args:
# - theme: theme, must be one of tempest, whirlwind
let
  colors = {
    tempest = { shadow_color = "#003175"; };
    typhoon = { shadow_color = "#5e1191"; };
    whirlwind = { shadow_color = "#00730b"; };
  };
in { config, pkgs, ... }:
# Picom configuration
{
  config = {
    services.picom = {
      enable = true;

      backend = "glx";

      extraArgs = [ ];

      vSync = true;

      wintypes = {
        tooltip = {
          fade = true;
          shadow = true;
          opacity = 0.75;
          focus = true;
          full-shadow = false;
        };
        dock = { shadow = false; };
        dnd = { shadow = false; };
        popup_menu = { opacity = 0.8; };
        dropdown_menu = { opacity = 0.8; };
      };

      # ---- Opacity ----
      activeOpacity = 0.9;
      inactiveOpacity = 0.75;

      # ---- Fade ----
      fade = true;
      fadeSteps = [ 3.0e-2 3.0e-2 ];

      opacityRules = [
        "100:class_g = 'firefox'"
        "100:class_g = 'Blender'"
        "100:class_g = 'Chromium'"
        "100:class_g = 'Google-chrome'"
        "100:class_g = 'vlc'"
        "100:class_g = 'discord'"
        "100:class_g = 'peek'"
        "100:class_g *= 'Minecraft'"
        "100:class_g *= 'i3lock'"
      ];

      # ---- Fade ----
      shadow = false;

      # ---- Rest of the settings ----
      settings = {

        round-borders = 1;
        corner-radius = 16;
        # ---- Blur ----

        # Parameters for background blurring, see the *BLUR* section for more information.
        blur-method = "dual_kawase";

        # xrender backend settings probably
        # blur-size = 12;
        # blur-strength = 5;
        #
        blur-deviation = true;

        # Blur background of semi-transparent / ARGB windows. 
        # Bad in performance, with driver-dependent behavior. 
        # The name of the switch may change without prior notifications.
        #
        blur-background = true;

        # Blur background of windows when the window frame is not opaque. 
        # Implies:
        #    blur-background 
        # Bad in performance, with driver-dependent behavior. The name may change.
        #
        # blur-background-frame = false

        # Use fixed blur strength rather than adjusting according to window opacity.
        # blur-background-fixed = false

        # Specify the blur convolution kernel, with the following format:
        # example:
        #   blur-kern = "5,5,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1";
        #
        # blur-kern = ''
        # blur-kern = "3x3box";
        blur-kern = "5,5,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1";

        # Exclude conditions for background blur.
        # blur-background-exclude = []
        blur-background-exclude = [
          "window_type = 'dock'"
          "window_type = 'desktop'"
          "_GTK_FRAME_EXTENTS@:c"
        ];

        focus-exclude = [ "class_g = 'Cairo-clock'" ];

        # Disable the use of damage information. 
        # This cause the whole screen to be redrawn everytime, instead of the part of the screen
        # has actually changed. Potentially degrades the performance, but might fix some artifacts.
        # The opposing option is use-damage
        #
        # no-use-damage = false
        use-damage = true;
      };
    };
  };
}
