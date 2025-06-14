{ config, pkgs, ... }:
# Slrn configuration
{
  config = {
    home.packages = [ pkgs.slrn ];
    # SLRN configuration file
    home.file = { ".slrnrc" = { source = ../../assets/config/slrnrc; }; };
  };
}
