{ config, pkgs, ... }:
# Eza Configuration (ls replacement)
{
  config = {
    programs.eza = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
      icons = "auto";
    };
  };
}
