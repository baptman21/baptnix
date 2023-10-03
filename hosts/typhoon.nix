{ config, pkgs, user, ... }:

{
  imports = [
    ../modules/system/i3-plasma.nix
    ../modules/system/krb5.nix
    ../modules/system/docker.nix
    ../modules/system/bluetooth.nix
  ];

  networking.firewall = {
    enable = true;
    allowPing = false;
  };

  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  # Enable swap on luks
  boot.initrd.luks.devices."luks-fe6c43be-ec3d-455d-9bd5-391b3f06357f".device = "/dev/disk/by-uuid/fe6c43be-ec3d-455d-9bd5-391b3f06357f";
  boot.initrd.luks.devices."luks-fe6c43be-ec3d-455d-9bd5-391b3f06357f".keyFile = "/crypto_keyfile.bin";

  boot = {
    kernelPackages = pkgs.linuxPackages_6_1;

    loader = {
      systemd-boot.enable = true;
      efi = {
        canTouchEfiVariables = true;
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

  systemd.services = {
    pritunl-client-service = {
      description = "Pritunl Client Daemon";
      script = "${pkgs.unstable.pritunl-client}/bin/pritunl-client-service";
      wantedBy = [ "multi-user.target" ];
    };
  };
}
