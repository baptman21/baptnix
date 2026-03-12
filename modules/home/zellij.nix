{ config, pkgs, ... }: {
  config = {
    programs.zellij = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
    };
  };
}
