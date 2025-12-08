{ config, pkgs, ... }:
# BaptComp Whirlwind configuration
{
  imports = [
    ../modules/home/bapt
    # packages
    ../modules/home/darwin_packages.nix
    # apps
    ../modules/home/fzf.nix
    ../modules/home/bat.nix
    ../modules/home/alacritty.nix
    ../modules/home/kitty.nix
    ../modules/home/git.nix
    ../modules/home/neovim.nix
    (import ../modules/home/lazyvim.nix {
      additionalPlugins =
        [ "disable_mason.lua" "ai.lua" "jira.lua" "mind.lua" ];
    })
    ../modules/home/nix-index.nix
    ../modules/home/aerospace.nix
    ../modules/home/eza.nix
    (import ../modules/home/starship.nix { theme = "storm"; })
    ../modules/home/vim.nix
    (import ../modules/home/zsh.nix {
      sshIdentities = "github_key id_ed25519.databricks";
    })
    (import ../modules/home/kube.nix { theme = "whirlwind"; })
    ../modules/home/direnv.nix
  ];

  config = {
    bapt = {
      # My own config
      theme = config.bapt.themes.expanse-dark;
    };

    home.username = "baptiste.bourdet";
    home.homeDirectory = "/Users/baptiste.bourdet";

    home.sessionPath = [ "$HOME/.local/bin" ];

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
      tf = "terraform";
      awse = "source ${pkgs.bapt.awsexport.awse}/bin/aws-export.sh";
      awsu = "source ${pkgs.bapt.awsexport.awsu}/bin/aws-unset.sh";
    };

    programs = {
      # Let Home Manager install and manage itself.
      home-manager.enable = true;
      bash.enable = true;
    };

    home.packages = [
      # need for linking of some rust
      pkgs.libiconv
      pkgs.rustfmt

      # for sponge
      pkgs.moreutils

      pkgs.maccy
      pkgs.sshfs
      pkgs.teleport
      pkgs.awscli2
      pkgs.ssm-session-manager-plugin
      pkgs.azure-cli
      pkgs.choose-gui
      pkgs.sops
      pkgs.starpls
      pkgs.tflint
      pkgs.ansible
      pkgs.bazel
    ];

    # SSH is setup manually because config is different
    home.file.".config/git/databricks_config".text = ''
      [user]
      	name = "baptiste.bourdet_data"
      	email = "baptiste.bourdet@databricks.com"
    '';

    programs = {
      starship = {
        enable = true;
        settings = {
          git_status = { disabled = true; };
          kubernetes.disabled = false;
        };
      };
      kitty.settings = {
        clipboard_control =
          "write-clipboard write-primary read-clipboard read-primary";
      };
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
