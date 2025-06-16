{ config, pkgs, ... }:
# Alacritty
{
  programs.alacritty = {
    enable = true;
    settings = {
      general = {
        import = [ "${pkgs.alacritty-theme}/share/alacritty-theme/iris.toml" ];
      };
    };
  };
}
