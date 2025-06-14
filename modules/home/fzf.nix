{ config, pkgs, ... }:
# FZF
{
  config = {
    programs.fzf = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
    };
  };
}
