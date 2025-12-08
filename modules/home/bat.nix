{ config, pkgs, ... }:
# Bat
{
  config = {
    programs.bat = { enable = true; };

    home.shellAliases = {
      by = "bat -l yaml";
      bj = "bat -l json";
    };
  };
}
