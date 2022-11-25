{ config, pkgs, ... }:

rec {
  # TODO: split into multiple configurations for multiple computers
  imports = [ ];
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

  home.file = import ./files.nix { inherit pkgs; };

  programs = {
    # Let Home Manager install and manage itself.
    home-manager.enable = true;

    bash.enable = true;
    fzf = import ./fzf.nix { };
    git = import ./git.nix { };
    ssh = import ./ssh.nix { homeDirectory = home.homeDirectory; };
    vim = import ./vim.nix { inherit pkgs; };
    zsh = import ./zsh.nix { };
  };

  xsession = {
    enable = true;
    windowManager.i3 = import ./i3.nix { inherit pkgs; };
  };
}
