{ config, pkgs, ... }:
# Remember the cant, old bucket, only used for config
{
  imports = [
    ../modules/home/bapt
    # packages
    ../modules/home/fzf.nix
    (import ../modules/home/kube.nix { theme = "typhoon"; })
    ../modules/home/neovim.nix
    (import ../modules/home/zsh.nix { sshAgent = false; })
    (import ../modules/home/lazyvim.nix {
      additionalPlugins = [ "ai.lua" "jira.lua" ];
      additionalOptions = ''
        -- Use kitty clipboard integration
        vim.g.clipboard = "osc52"
      '';
    })
    ../modules/home/eza.nix
    (import ../modules/home/starship.nix { theme = "cant"; })
  ];

  config = {
    bapt = {
      # My own config
      theme = config.bapt.themes.expanse-dark;
    };

    home.username = "baptiste.bourdet";
    home.homeDirectory = "/home/baptiste.bourdet";

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

    home.sessionPath = [ ];
  };
}
