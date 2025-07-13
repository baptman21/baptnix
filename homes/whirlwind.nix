{ config, pkgs, ... }:
# BaptComp Whirlwind configuration
{
  imports = [
    # packages
    ../modules/home/packages.nix
    # apps
    ../modules/home/fzf.nix
    ../modules/home/git.nix
    # Hyperland
    ../modules/home/kitty.nix
    ../modules/home/dunst.nix
    ../modules/home/eww.nix
    ../modules/home/wofi.nix
    (import ../modules/home/hyprland.nix {
      theme = "whirlwind";
      modifier = "SUPER";
      background_image = ../assets/wallpapers/forest-botw.jpg;
    })
    ../modules/home/neovim.nix
    (import ../modules/home/lazyvim.nix { })
    (import ../modules/home/kde-theme.nix { theme = "whirlwind"; })
    ../modules/home/nix-index.nix
    (import ../modules/home/starship.nix {
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
    (import ../modules/home/zsh.nix { })
    # services
    ../modules/home/blueman.nix
    (import ../modules/home/kube.nix { theme = "whirlwind"; })
    ../modules/home/direnv.nix
  ];

  config = {
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

    home.shellAliases = { tf = "terraform"; };

    programs = {
      # Let Home Manager install and manage itself.
      home-manager.enable = true;
      bash.enable = true;
    };
  };
}
