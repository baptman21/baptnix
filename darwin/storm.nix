{ config, pkgs, inputs, ... }:
let
  hostname = "F257QQPYTF";
  username = "baptiste.bourdet";
in
{
  imports = [
    # ../modules/darwin/homebrew.nix
  ];

  environment.systemPackages = [ pkgs.vim ];

  nix.settings.experimental-features = "nix-command flakes";

  system.stateVersion = 5;

  nixpkgs.hostPlatform = "${pkgs.system}";

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;

  networking.hostName = hostname;
  networking.computerName = hostname;
  system.defaults.smb.NetBIOSName = hostname;

  users.users."${username}"= {
    home = "/Users/${username}";
    description = username;
  };

  nix.settings.trusted-users = [ username ];

  system.defaults.NSGlobalDomain."com.apple.sound.beep.volume" = 0.0;
}
