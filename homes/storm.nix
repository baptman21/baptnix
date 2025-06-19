{ config, pkgs, ... }:
# BaptComp Whirlwind configuration
{
  imports = [
    # packages
    ../modules/home/darwin_packages.nix
    # apps
    ../modules/home/fzf.nix
    ../modules/home/alacritty.nix
    ../modules/home/git.nix
    ../modules/home/neovim.nix
    ../modules/home/lazyvim.nix
    ../modules/home/nix-index.nix
    ../modules/home/aerospace.nix
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

    home.shellAliases = {
      lvim = "zvim";
      tf = "terraform";
    };

    programs = {
      # Let Home Manager install and manage itself.
      home-manager.enable = true;
      bash.enable = true;
    };

    # SSH is setup manually because config is different
    home.file.".config/git/databricks_config".text = ''
      [user]
      	name = "baptiste.bourdet_data"
      	email = "baptiste.bourdet@databricks.com"
    '';

    home.packages = [ pkgs.choose-gui ];

    programs = {
      git = {
        includes = [{
          path = "${config.home.homeDirectory}/.config/git/databricks_config";
          condition = "gitdir:${config.home.homeDirectory}/databricks/**";
        }];
        extraConfig = { github.username = "baptiste.bourdet_data"; };
      };
      ssh = let sshDir = config.home.homeDirectory + "/.ssh";
      in {
        enable = true;
        extraConfig = ''
          AddKeysToAgent yes
          SendEnv EDITOR
        '';
        includes = [ "${sshDir}/arca.ssh" ];
        matchBlocks = {
          "github.com-baptman" = {
            identityFile = sshDir + "/github_key";
            hostname = "github.com";
          };
          "github.com" = {
            identityFile = sshDir + "/id_ed25519.databricks";
            hostname = "github.com";
          };
          "github.com-neon" = {
            identityFile = sshDir + "/id_ed25519.neon";
            hostname = "github.com";
          };

        };
      };
    };
  };
}
