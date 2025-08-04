{ writeText }:
let
  # ToKittyConf formats a theme for kitty. Returns the content of a kitty
  # config with the theme.
  #
  # args:
  # - theme: a theme config as defined in config.bapt.themes
  toLazyvimTheme = theme:
    writeText "lazyvim-theme-${theme.name}.lua" ''
      -- Generated from nix with theme
      return {
        {
          "navarasu/onedark.nvim",
          opts = {
            colors = {
              black = "${theme.colors.black}",
              bg0 = "${theme.background.zero}",
              bg1 = "${theme.background.one}",
              bg2 = "${theme.background.two}",
              bg3 = "${theme.background.three}",
              bg_blue = "${theme.colors.lightBlue}",
              bg_yellow = "${theme.special.search}",
              fg = "${theme.foreground.one}",
              purple = "${theme.colors.lightPurple}",
              green = "${theme.colors.green}",
              orange = "${theme.colors.yellow}",
              blue = "${theme.colors.blue}",
              yellow = "${theme.colors.lightYellow}",
              cyan = "${theme.colors.lightCyan}",
              red = "${theme.colors.lightRed}",
              grey = "${theme.colors.grey}",
              light_grey = "${theme.colors.lightGrey}",
              dark_cyan = "${theme.colors.cyan}",
              dark_red = "${theme.colors.red}",
              dark_yellow = "${theme.colors.lightYellow}",
              dark_purple = "${theme.colors.purple}",
              -- TODO: change back
              diff_add = "${theme.colors.green}",
              diff_delete = "${theme.colors.red}",
              diff_change = "${theme.special.diffChange}",
              diff_text = "${theme.special.diffText}",
            },
          },
        },
      }
    '';
in toLazyvimTheme
