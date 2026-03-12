{ config, pkgs, ... }: {
  config = {
    programs.zellij = {
      enable = true;
      enableZshIntegration = false;
      enableBashIntegration = false;
    };
  };
}
