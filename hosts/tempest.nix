{ config, pkgs, user, ... }:

{
  imports = [
    ../modules/system/i3-plasma.nix
    ../modules/system/docker.nix
    ../modules/system/bluetooth.nix
  ];

  # Setup keyfile
  boot.initrd.secrets = { "/crypto_keyfile.bin" = null; };

  # Enable swap on luks
  boot.initrd.luks.devices."luks-4ffd049f-1426-436b-8f77-191b69a361e1".device =
    "/dev/disk/by-uuid/4ffd049f-1426-436b-8f77-191b69a361e1";
  boot.initrd.luks.devices."luks-4ffd049f-1426-436b-8f77-191b69a361e1".keyFile =
    "/crypto_keyfile.bin";

  boot = {
    kernelPackages = pkgs.linuxPackages_6_1;

    loader = {
      systemd-boot.enable = true;
      efi = { canTouchEfiVariables = true; };

      # timeout = 15;
      # grub = {
      #   enable = true;
      #   device = "/dev/sda";
      #   useOSProber = true;
      # };
    };
  };

  services = { xserver = { videoDrivers = [ "nvidia" ]; }; };
}
