{ config, pkgs, ... }:
# BaptComp Whirlwind configuration
{
  imports = [
    # packages
    ../modules/home/packages.nix
    # apps
    ../modules/home/fzf.nix
    ../modules/home/git.nix
    (import ../modules/home/i3-plasma.nix {
      theme = "typhoon";
      modifier = "Mod4";
      background_image = ../assets/wallpapers/purple-planet.jpg;
    })
    ../modules/home/lunarvim.nix
    ../modules/home/nix-index.nix
    ../modules/home/slrn.nix
    (import ../modules/home/starship.nix { theme = "typhoon"; })
    (import ../modules/home/ssh.nix { sshDir = config.home.homeDirectory + "/.ssh"; })
    ../modules/home/vim.nix
    ../modules/home/zsh.nix
    # services
    (import ../modules/home/picom.nix { theme = "typhoon"; })
    (import ../modules/home/polybar.nix { theme = "typhoon"; })
    ../modules/home/blueman.nix
  ];

  home.username = "baptman";
  home.homeDirectory = "/home/baptman";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.05";

  nixpkgs.config.allowUnfree = true;

  programs = {
    # Let Home Manager install and manage itself.
    home-manager.enable = true;
    bash.enable = true;
  };

  home.packages = [
    pkgs.kubectl
    pkgs.azure-cli
    pkgs.terraform
    pkgs.awscli2
    # Client VPN
    pkgs.pritunl-client
    pkgs.postgresql
    pkgs.redis
  ];

}
