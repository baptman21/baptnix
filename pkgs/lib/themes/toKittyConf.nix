{ writeText }:
let
  # ToKittyConf formats a theme for kitty. Returns the content of a kitty
  # config with the theme.
  #
  # args:
  # - theme: a theme config as defined in config.bapt.themes
  toKittyConf = theme:
    writeText "kitty-theme-${theme.name}.conf" ''
      # Colors (${theme.name})
      background ${theme.background.zero}
      foreground ${theme.foreground.one}

      selection_foreground ${theme.foreground.two}
      # TODO: add more background colors
      selection_background ${theme.background.zero}

      # Black
      color0 ${theme.colors.black}
      color8 ${theme.colors.lightBlack}

      # Red
      color1 ${theme.colors.red}
      color9 ${theme.colors.lightRed}

      # Green
      color2 ${theme.colors.green}
      color10 ${theme.colors.lightGreen}

      # Yellow
      color3 ${theme.colors.yellow}
      color11 ${theme.colors.lightYellow}

      # Blue
      color4 ${theme.colors.blue}
      color12 ${theme.colors.lightBlue}

      # Magenta
      color5 ${theme.colors.purple}
      color13 ${theme.colors.lightPurple}

      # Cyan
      color6 ${theme.colors.cyan}
      color14 ${theme.colors.lightCyan}

      # White
      color7 ${theme.colors.white}
      color15 ${theme.colors.lightWhite}

      url_color #69e9f5
      url_style single
    '';
in toKittyConf
