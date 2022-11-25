{ config, pkgs, ... }:
# BaptComp Laptop configuration
{
  imports = [
    # packages
    ../pkgs/common_packages.nix
    # apps
    ../pkgs/fzf.nix
    ../pkgs/git.nix
    (import ../pkgs/i3-plasma.nix { modifier = "Mod4"; })
    ../pkgs/polybar.nix
    (import ../pkgs/ssh.nix { sshDir = config.home.homeDirectory + "/.ssh"; })
    ../pkgs/vim.nix
    ../pkgs/zsh.nix
  ];
}
