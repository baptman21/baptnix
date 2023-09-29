{ config, pkgs, ... }:
# BaptComp Tempest configuration
{
  imports = [
    # packages
    ../modules/home/packages.nix
    # apps
    ../modules/home/fzf.nix
    ../modules/home/git.nix
    (import ../modules/home/i3-plasma.nix { modifier = "Mod4"; background_image = ../assets/wallpapers/the-expanse-1440p.png; })
    ../modules/home/lunarvim.nix
    ../modules/home/nix-index.nix
    ../modules/home/slrn.nix
    ../modules/home/starship.nix
    (import ../modules/home/ssh.nix { sshDir = config.home.homeDirectory + "/.ssh"; })
    ../modules/home/vim.nix
    ../modules/home/zsh.nix
    # services
    ../modules/home/picom.nix
    (import ../modules/home/polybar.nix { theme = "tempest"; })
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
}
