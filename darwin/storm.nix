{ config, pkgs, inputs, ... }:
let
  hostname = "F257QQPYTF";
  username = "baptiste.bourdet";
in {
  imports = [
    # ../modules/darwin/homebrew.nix
  ];

  environment.systemPackages = [ pkgs.vim ];

  nix.settings.experimental-features = "nix-command flakes";

  nixpkgs.hostPlatform = "${pkgs.system}";

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;

  networking.hostName = hostname;
  networking.computerName = hostname;
  system = {
    stateVersion = 5;
    defaults = {
      smb.NetBIOSName = hostname;
      NSGlobalDomain."com.apple.sound.beep.volume" = 0.0;
      finder.AppleShowAllExtensions = true;
      screensaver.askForPassword = true;
      NSGlobalDomain."com.apple.swipescrolldirection" = false;
    };
  };

  users.users."${username}" = {
    home = "/Users/${username}";
    description = username;
  };

  nix.settings.trusted-users = [ username ];
}
