{ theme }:
# KDE Them configuration
#
# Args:
# - theme: one of tempest, whirlwind
#
let
  colors = {
    tempest = {
      primary = "#0458cf";
      primary_rgb = "4,88,207";
    };
    typhoon = {
      primary = "#a51fff";
      primary_rgb = "165,31,255";
    };
    whirlwind = {
      primary = "#11d116";
      primary_rgb = "17,209,22";
    };
  };
in
{ config, pkgs, ... }:
let
  colors_with_theme = pkgs.substituteAll {
    src = ../../assets/kde-theme-custom/colorschemes/NordicDarker.colors.tmpl;
    theme_color = colors.${theme}.primary_rgb;
  };
in
{
  home.file.".local/share/color-schemes/NordicDarker.colors".source = colors_with_theme;

  home.file.".local/share/aurorae/themes/Nordic".source = ../../assets/kde-theme-custom/aurorae/Nordic;
  home.file.".local/share/plasma/desktoptheme/Nordic-darker".source = ../../assets/kde-theme-custom/plasma/desktoptheme/Nordic-darker;
  home.file.".local/share/plasma/look-and-feel/Nordic-darker".source = ../../assets/kde-theme-custom/plasma/look-and-feel/Nordic-darker;
  home.file.".local/share/icons/Nordic-darker".source = ../../assets/kde-theme-custom/folders/Nordic-darker;
  home.file.".icons/Nordic-cursors".source = ../../assets/kde-theme-custom/cursors/Nordic-cursors;

}
