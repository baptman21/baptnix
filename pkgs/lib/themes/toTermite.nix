{ writeText }:
let
  # toTermite formats a theme for termite
  #
  # args:
  # - theme: a theme config as defined in config.bapt.themes
  toTermite = theme:
    writeText "termite-${theme.name}.conf" ''
      [colors]

      # special
      foreground      = ${theme.foreground.one}
      foreground_bold = ${theme.foreground.two}
      cursor          = ${theme.special.cursor}
      background      = ${theme.background.one}

      # black
      color0  = ${theme.colors.black}
      color8  = ${theme.colors.lightBlack}

      # red
      color1  = ${theme.colors.red}
      color9  = ${theme.colors.lightRed}

      # green
      color2  = ${theme.colors.green}
      color10 = ${theme.colors.lightGreen}

      # yellow
      color3  = ${theme.colors.yellow}
      color11 = ${theme.colors.lightYellow}

      # blue
      color4  = ${theme.colors.blue}
      color12 = ${theme.colors.lightBlue}

      # magenta
      color5  = ${theme.colors.purple}
      color13 = ${theme.colors.lightPurple}

      # cyan
      color6  = ${theme.colors.cyan}
      color14 = ${theme.colors.lightCyan}

      # white
      color7  = ${theme.colors.white}
      color15 = ${theme.colors.lightWhite}

    '';
in toTermite
