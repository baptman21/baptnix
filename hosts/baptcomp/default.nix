{ config, pkgs, user, ... }:

{
  imports = [
    /etc/nixos/hardware-configuration.nix
    ../../modules/system/i3-plasma.nix
    ../../modules/system/krb5.nix
    ../../modules/system/docker.nix
    ../../modules/system/bluetooth.nix
  ];


  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  # Enable swap on luks
  boot.initrd.luks.devices."luks-4670bb1a-e67c-4925-9808-51483d8e3315".device = "/dev/disk/by-uuid/4670bb1a-e67c-4925-9808-51483d8e3315";
  boot.initrd.luks.devices."luks-4670bb1a-e67c-4925-9808-51483d8e3315".keyFile = "/crypto_keyfile.bin";

  boot = {
    kernelPackages = pkgs.linuxPackages_6_0;

    loader = {
      systemd-boot.enable = true;
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };

      # timeout = 15;
      # grub = {
      #   enable = true;
      #   device = "/dev/sda";
      #   useOSProber = true;
      # };
    };
  };

  services = { };
}
