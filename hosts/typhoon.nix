{ config, pkgs, user, ... }:

{
  imports = [
    ../modules/system/i3-plasma.nix
    ../modules/system/docker.nix
    ../modules/system/bluetooth.nix
  ];

  networking.firewall = {
    enable = true;
    allowPing = false;
  };

  # Enable swap on luks
  boot.initrd.luks.devices."luks-8f9f4ba5-e524-4fa8-b986-73624f140b6a".device =
    "/dev/disk/by-uuid/8f9f4ba5-e524-4fa8-b986-73624f140b6a";

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

  services = {
    fprintd.enable = true;
    fprintd.tod.enable = true;
    fprintd.tod.driver = pkgs.libfprint-2-tod1-vfs0090;
  };

  security.pam.services.login.fprintAuth = false;

  environment = { systemPackages = with pkgs; [ fprintd ]; };

  systemd.services = {
    pritunl-client-service = {
      description = "Pritunl Client Daemon";
      script = "${pkgs.unstable.pritunl-client}/bin/pritunl-client-service";
      wantedBy = [ "multi-user.target" ];
    };
  };
}
