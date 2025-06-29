{ config, pkgs, ... }:
# Alacritty
{
  programs.alacritty = {
    enable = true;
    settings = {
      general = {
        import = [ "${pkgs.alacritty-theme}/share/alacritty-theme/iris.toml" ];
      };
      font = {
        normal = {
          family = "Hack Nerd Font";
          style = "Regular";
        };
        size = 16;
      };
    };
  };
}
