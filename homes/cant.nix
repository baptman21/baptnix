{ config, pkgs, ... }:
# Remember the cant, old bucket, only used for config
{
  imports = [
    # packages
    ../modules/home/fzf.nix
    ../modules/home/neovim.nix
    (import ../modules/home/zsh.nix { })
    (import ../modules/home/lazyvim.nix {
      additionalPlugins = [ "ai.lua" "jira.lua" ];
    })
    ../modules/home/eza.nix
    (import ../modules/home/starship.nix { theme = "cant"; })
  ];

  config = {
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
        settings = { git_status = { disabled = true; }; };
      };
    };

    home.packages = with pkgs; [
      # packages
      rustc
      cargo
      eternal-terminal
    ];

    systemd.user.services = {
      # Eternal terminal
      et = {
        description = "Eternal Terminal for better SSH";
        wantedBy = [ "multi-user.target" ];
        after = [ "network.target" "syslog.target" ];
        serviceConfig = {
          Type = "simple";
          ExecStart = "${pkgs.eternal-terminal}/bin/et";
          Restart = "on-failure";
        };
      };
    };
  };
}
