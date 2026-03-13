{ config, pkgs, ... }: {
  config = {
    programs.gh = {
      enable = true;
      package = pkgs.unstable.gh;
    };
  };
}
