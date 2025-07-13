{ config, pkgs, ... }:
# Eww config (widget and status bar)
{
  config = {
    programs.eww = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      configDir = ../../assets/eww;
    };
  };
}
