{ config, pkgs, inputs, ... }:
let
  hostname = "F257QQPYTF";
  username = "baptiste.bourdet";
in {
  imports = [ ../modules/darwin/homebrew.nix ../modules/darwin/sketchybar.nix ];

  config = {

    environment = {
      # Environment variables
      variables = {
        EDITOR = "vim";
        VISUAL = "vim";
        PAGER = "less";
      };

      systemPackages = [ pkgs.vim ];
    };

    nix.settings.experimental-features = "nix-command flakes";

    # Auto upgrade nix package and the daemon service.
    nix.package = pkgs.nix;

    networking.hostName = hostname;
    networking.computerName = hostname;
    system = {
      stateVersion = 5;
      primaryUser = username;
      defaults = {
        smb.NetBIOSName = hostname;
        NSGlobalDomain."com.apple.sound.beep.volume" = 0.0;
        finder.AppleShowAllExtensions = true;
        screensaver.askForPassword = true;
        NSGlobalDomain."com.apple.swipescrolldirection" = false;
        NSGlobalDomain._HIHideMenuBar = true;
        dock.autohide = true;
      };
    };
    security.pam.services.sudo_local.touchIdAuth = true;

    users.users."${username}" = {
      home = "/Users/${username}";
      description = username;
    };

    nix.settings.trusted-users = [ username ];

    # Fonts Definition

    fonts.packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      liberation_ttf
      fira-code
      fira-code-symbols
      mplus-outline-fonts.githubRelease
      dina-font
      proggyfonts
      terminus_font
      terminus_font_ttf
      termsyn
      font-awesome
      nerd-fonts.hack
      nerd-fonts.noto
      nerd-fonts.iosevka
      nerd-fonts.terminess-ttf
      siji
    ];

    # Install dbx cli
    homebrew = {
      taps = [{
        name = "databricks/tap";
        clone_target = "git@github.com:databricks/tap";
      }];

      brews = [ "neonctl" "rsync" "databricks" ];

      casks = [ "obsidian" ];
    };

  };
}
