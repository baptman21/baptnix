{ config, pkgs, ... }:
# Kitty
{
  programs.kitty = {
    enable = true;
    font = {
      name = "Hack Nerd Font Mono";
      size = 16;
    };
    # themeFile = "tokyo_night_storm";
    # themeFile = "1984_dark";
    shellIntegration = {
      enableZshIntegration = true;
      enableBashIntegration = true;
    };
    darwinLaunchOptions = [ ];
    settings = {
      scrollback_pager_history_size = 4000; # 4 go
      scrollback_lines = 4000; # 4k lines in ram

      copy_on_select = true;

      enable_audio_bell = false;

      background_opacity = 0.9;
      background_blur = 10;
    };
    extraConfig = ''
      # Custom Iris theme
      include ${../../assets/themes/iris/kitty.conf}
    '';
  };
}
