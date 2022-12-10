{ config, pkgs, user, ... }:

{
  imports = [
    /etc/nixos/hardware-configuration.nix
    ../../modules/system/i3-plasma.nix
    ../../modules/system/krb5.nix
    ../../modules/system/docker.nix
  ];

  boot = {
    loader = {
    # systemd-boot.enable = true;
    # efi = {
    #   canTouchEfiVariables = true;
    #   efiSysMountPoint = "/boot/efi";
    # };

    # timeout = 15;
      grub = {
        enable = true;
        device = "/dev/sda";
        useOSProber = true;
      };
    };
  };

  services = { };
}
