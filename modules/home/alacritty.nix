{ config, pkgs, ... }:
# Alacritty
{
  programs.alacritty = {
    enable = true;
    settings = {
      general = {
        import = [ "${pkgs.alacritty-theme}/share/alacritty-theme/iris.toml" ];
      };
      window = { opacity = 0.9; };
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
