{ config, pkgs, ... }:
# Blueman for bluetooth
{
  services.blueman-applet.enable = true;
}
