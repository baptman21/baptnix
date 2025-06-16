{ config, pkgs, ... }:
# BaptComp Tempest configuration
{
  imports = [
    # packages
    ../modules/home/packages.nix
    # apps
    ../modules/home/fzf.nix
    ../modules/home/git.nix
    (import ../modules/home/i3-plasma.nix {
      theme = "tempest";
      modifier = "Mod4";
      background_image = ../assets/wallpapers/the-expanse-1440p.png;
    })
    ../modules/home/neovim.nix
    ../modules/home/lunarvim.nix
    ../modules/home/lazyvim.nix
    (import ../modules/home/kde-theme.nix { theme = "tempest"; })
    ../modules/home/nix-index.nix
    (import ../modules/home/starship.nix { theme = "tempest"; })
    (import ../modules/home/ssh.nix {
      sshDir = config.home.homeDirectory + "/.ssh";
    })
    ../modules/home/vim.nix
    ../modules/home/zsh.nix
    # services
    (import ../modules/home/picom.nix { theme = "tempest"; })
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
  home.stateVersion = "23.11";

  nixpkgs.config.allowUnfree = true;

  programs = {
    # Let Home Manager install and manage itself.
    home-manager.enable = true;
    bash.enable = true;
  };
}
