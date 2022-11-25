{ config, pkgs, ... }:

{
  # TODO: split into multiple configurations for multiple computers
  imports = [
    ./fzf.nix
    ./git.nix
    (import ./i3.nix { modifier = "Mod4"; })
    ./polybar.nix
    (import ./ssh.nix { sshDir = config.home.homeDirectory + "/.ssh"; })
    ./vim.nix
    ./zsh.nix
  ];
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
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
  home.stateVersion = "22.05";

  home.packages = import ./pkgs.nix { inherit pkgs; };

  programs = {
    # Let Home Manager install and manage itself.
    home-manager.enable = true;
    bash.enable = true;
  };
}
