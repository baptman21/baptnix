{ config, pkgs, ... }:
# Hyperland system config
{
  config = {
    programs.hyprland.enable = true;

    # Mounting disks service, used by udiskie
    services.udisks2.enable = true;

    # Hint electron app to use wayland
    environment.sessionVariables.NIXOS_OZONE_WL = "1";

    environment.systemPackages = [
      # ... other packages
      pkgs.kitty # required for the default Hyprland config
    ];
  };
}
