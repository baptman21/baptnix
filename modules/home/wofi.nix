{ config, pkgs, ... }:
# Wofi config (app launcher)
{
  config = {
    programs.wofi = {
      enable = true;
      settings = { };
      # style = "";
    };
  };
}
