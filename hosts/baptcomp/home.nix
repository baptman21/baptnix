{ config, pkgs, ... }:
# BaptComp Laptop configuration
{
  imports = [
    # packages
    ../../modules/home/common_packages.nix
    # apps
    ../../modules/home/fzf.nix
    ../../modules/home/git.nix
    (import ../../modules/home/i3-plasma.nix { modifier = "Mod4"; })
    ../../modules/home/slrn.nix
    (import ../../modules/home/ssh.nix { sshDir = config.home.homeDirectory + "/.ssh"; })
    ../../modules/home/vim.nix
    ../../modules/home/zsh.nix
    # services
    ../../modules/home/picom.nix
    ../../modules/home/polybar.nix
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
  home.stateVersion = "22.11";

  nixpkgs.config.allowUnfree = true;

  programs = {
    # Let Home Manager install and manage itself.
    home-manager.enable = true;
    bash.enable = true;
  };
}
