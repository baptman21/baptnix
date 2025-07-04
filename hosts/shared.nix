{ config, inputs, lib, pkgs, ... }:

{
  imports = [ ];

  # User definition
  users = {
    users."baptman" = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "video"
        "audio"
        "camera"
        "networkmanager"
        "lp"
        "kvm"
        "libvirtd"
        "plex"
        "docker"
      ];
      initialPassword = "baptcave";
    };

    defaultUserShell = pkgs.bash;
  };

  # User does not need to give password when using sudo.
  security.sudo.wheelNeedsPassword = false;

  networking.networkmanager.enable = true;

  # networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Time zone and internationalisation
  time.timeZone = "Europe/Paris";

  # Locales settings
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "fr_FR.utf8";
      LC_IDENTIFICATION = "fr_FR.utf8";
      LC_MEASUREMENT = "fr_FR.utf8";
      LC_MONETARY = "fr_FR.utf8";
      LC_NAME = "fr_FR.utf8";
      LC_NUMERIC = "fr_FR.utf8";
      LC_PAPER = "fr_FR.utf8";
      LC_TELEPHONE = "fr_FR.utf8";
      LC_TIME = "fr_FR.utf8";
    };
  };

  security.rtkit.enable = true;

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

  environment = {
    # Environment variables
    variables = {
      EDITOR = "vim";
      VISUAL = "vim";
      PAGER = "less";
    };

    localBinInPath = true;

    systemPackages = with pkgs; [ vim git wget pipewire ];
  };

  services.pulseaudio.enable = false;

  # Allow the flash of ZSA keyboars
  hardware.keyboard.zsa.enable = true;

  # Enable the X11 windowing system.
  services = {
    printing.enable = true;

    # Enable touchpad support
    libinput.enable = true;

    # Enable bin/bash shebang cf. https://unix.stackexchange.com/a/788456
    envfs.enable = true;

    xserver = {
      enable = true;

      xkb = {
        variant = "";
        # Keyboard layout
        layout = "us";
      };
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      audio.enable = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;

      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      #media-session.enable = true;
    };
  };

  nix = {
    # Nix Package Manager settings
    settings = { auto-optimise-store = true; };

    # Garbage collector settings
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };

    # Enable nixFlakes on system
    package = pkgs.nixVersions.latest;
    registry.nixpkgs.flake = inputs.nixpkgs;
    registry.unstable.flake = inputs.unstable;

    extraOptions = ''
      experimental-features = nix-command flakes
      keep-outputs = true
      keep-derivations = true
    '';
  };

  system = {
    # You should not modify this by hand !
    stateVersion = "23.11";
  };
}
