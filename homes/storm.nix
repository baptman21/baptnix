{ config, pkgs, ... }:
# BaptComp Whirlwind configuration
{
  imports = [
    # packages
    ../modules/home/darwin_packages.nix
    # apps
    ../modules/home/fzf.nix
    ../modules/home/git.nix
    ../modules/home/neovim.nix
    ../modules/home/lazyvim.nix
    ../modules/home/nix-index.nix
    (import ../modules/home/starship.nix {
      # TODO: change theme
      theme = "whirlwind";
      extraSettings = {
        kubernetes = {
          disabled = false;
          format = "\\[[$symbol$context( \\($namespace\\))]($style)\\] ";
        };
      };
    })
    (import ../modules/home/ssh.nix {
      sshDir = config.home.homeDirectory + "/.ssh";
    })
    ../modules/home/vim.nix
    ../modules/home/zsh.nix
    (import ../modules/home/kube.nix { theme = "whirlwind"; })
    ../modules/home/direnv.nix
  ];

  config = {
    home.username = "baptiste.bourdet";
    home.homeDirectory = "/Users/baptiste.bourdet";

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

    home.shellAliases = {
      lvim = "zvim";
      tf = "terraform";
    };

    programs = {
      # Let Home Manager install and manage itself.
      home-manager.enable = true;
      bash.enable = true;
    };
  };
}
