{ config, pkgs, ... }:
# Blueman for bluetooth
{
  config = { services.blueman-applet.enable = true; };
}
