{ config, pkgs, ... }:
# Windows WSL 2
{
  imports = [
    ../modules/home/bapt
    # packages
    ../modules/home/fzf.nix
    ../modules/home/packages.nix
    ../modules/home/bat.nix
    ../modules/home/neovim.nix
    (import ../modules/home/zsh.nix { })
    (import ../modules/home/lazyvim.nix {
      additionalPlugins = [ "disable_mason.lua" "mind.lua" ];
    })
    ../modules/home/git.nix
    (import ../modules/home/ssh.nix {
      sshDir = config.home.homeDirectory + "/.ssh";
    })

    ../modules/home/eza.nix
    (import ../modules/home/starship.nix { theme = "cant"; })
  ];

  config = {
    bapt = {
      # My own config
      theme = config.bapt.themes.expanse-dark;
    };

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

    programs = {
      # Let Home Manager install and manage itself.
      home-manager.enable = true;
      bash.enable = true;
      go.enable = true;

      starship = {
        enable = true;
        settings = {
          git_status = { disabled = true; };
          kubernetes.disabled = false;
        };
      };
    };

    home.packages = with pkgs; [
      # packages
      rustc
      cargo
      golint
      pkg-config
      gpgme.dev

      # for sponge
      pkgs.moreutils
      pkgs.rustfmt
    ];

    home.sessionPath = [ "$HOME/.local/bin" ];
  };
}
