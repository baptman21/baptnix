{ config, pkgs, ... }:
# Enable bluetooth
{
  config = {
    hardware.bluetooth = {
      enable = true;
      settings = { General = { Enable = "Source,Sink,Media,Socket"; }; };
    };

    services = { blueman.enable = true; };
  };
}
