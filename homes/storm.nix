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
      theme = "storm";
      extraSettings = {
        kubernetes = {
          disabled = false;
          format = "\\[[$symbol$context( \\($namespace\\))]($style)\\] ";
        };
      };
    })
    ../modules/home/vim.nix
    (import ../modules/home/zsh.nix {
      sshIdentities = "github_key id_ed25519.databricks";
    })
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

    home.file.".aws/config".text = ''
      # DATABRICKS
      ## SSO SESSIONS
      [sso-session dbx-root-sso]
      sso_start_url = https://databricks-aws-root.awsapps.com/start
      sso_region = us-west-2
      sso_registration_scopes = sso:account:access

      [sso-session dbx-rnd-root-sso]
      sso_start_url = https://databricks-aws-rnd-root.awsapps.com/start
      sso_region = us-west-2
      sso_registration_scopes = sso:account:access

      ## PROFILES
      [profile dbx-dev-view]
      sso_session = dbx-rnd-root-sso
      sso_account_id = 707343435239
      sso_role_name = databricks-view-only
      region = us-west-2
      output = json

      [profile dbx-stg-view]
      sso_session = dbx-rnd-root-sso
      sso_account_id = 548125073166
      sso_role_name = databricks-view-only
      region = us-west-2
      output = json

      # NEON
      ## SSO SESSIONS
      [sso-session neon-sso]
      sso_start_url = https://neondb.awsapps.com/start
      sso_region = eu-central-1
      sso_registration_scopes = sso:account:access

      ## PROFILES
      [profile neon-main]
      sso_session = neon-sso
      sso_account_id = 112633209199
      sso_role_name = AdministratorAccess
      region = us-east-2
      output = json

      [profile neon-dev]
      sso_session = neon-sso
      sso_account_id = 369495373322
      sso_role_name = AdministratorAccess
      region = us-east-2
      output = json

      [profile neon-prod]
      sso_session = neon-sso
      sso_account_id = 093970136003
      sso_role_name = AdministratorAccess
      sso_region = eu-central-1
      region = eu-central-1
      output = json
    '';

    home.packages = [
      pkgs.maccy
      pkgs.sshfs
      pkgs.teleport
      pkgs.awscli2
      pkgs.azure-cli
      pkgs.choose-gui
      pkgs.sops
      pkgs.starpls
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
        settings = { git_status = { disabled = true; }; };
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
