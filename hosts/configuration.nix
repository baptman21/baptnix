{ config, inputs, lib, location, pkgs, user, system, ... }:

{
  imports = [ ];

  # User definition
  users = {
    users."baptman" = {
      isNormalUser = true;
      extraGroups = [ "wheel" "video" "audio" "camera" "networkmanager" "lp" "kvm" "libvirtd" "plex" "docker" ];
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

  fonts.fonts = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
    terminus_font
    terminus_font_ttf
    terminus-nerdfont
    font-awesome
    (nerdfonts.override { fonts = [ "Hack" "Noto" "Iosevka" "Terminus" ]; })
    siji
  ];

  environment = {
    # Environment variables
    variables = {
      EDITOR = "vim";
      VISUAL = "vim";
      PAGER = "less";
    };
    systemPackages = with pkgs; [
      vim
      git
      wget
      inputs.home-manager.defaultPackage.${system}
    ];
  };

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  sound.mediaKeys.enable = true;

  # Enable the X11 windowing system.
  services = {
    printing.enable = true;

    xserver = {
      enable = true;
      # Keyboard layout
      layout = "us";
      # Enable touchpad support
      libinput.enable = true;

      xkbVariant = "";
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
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
    settings = {
      auto-optimise-store = true;
    };

    # Garbage collector settings
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };

    # Enable nixFlakes on system
    package = pkgs.nixVersions.unstable;
    registry.nixpkgs.flake = inputs.nixpkgs;

    extraOptions = ''
      experimental-features = nix-command flakes
      keep-outputs = true
      keep-derivations = true
    '';
  };

  # Allow proprietary software.
  nixpkgs.config.allowUnfree = true;

  system = {
    # You should not modify this by hand !
    stateVersion = "22.11";
  };
}
