{ config, pkgs, ... }:
# Dunst config
{
  config = {
    services.dunst = {
      # Enable
      enable = true;
      # TODO: theme and config
    };
  };
}
