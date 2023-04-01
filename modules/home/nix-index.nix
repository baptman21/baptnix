{ config, pkgs, ... }:
# nix-index to search packages and dependencies easily
{
  programs.nix-index = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
  };
}
