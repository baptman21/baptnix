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
    };
    typhoon = {
      primary = "#a51fff";
    };
    whirlwind = {
      primary = "#11d116";
    };
  };
in
{ config, pkgs, ... }:
# I3 configuration to use with KDE
{
  home.file.".local/share/color-schemes/NordicDarker.colors".source = ../../assets/kde-theme-custom/colorschemes/NordicDarker.colors;
  home.file.".local/share/aurorae/themes/Nordic".source = ../../assets/kde-theme-custom/aurorae/Nordic;
  home.file.".local/share/plasma/desktoptheme/Nordic-darker".source = ../../assets/kde-theme-custom/plasma/desktoptheme/Nordic-darker;
  home.file.".local/share/plasma/look-and-feel/Nordic-darker".source = ../../assets/kde-theme-custom/plasma/look-and-feel/Nordic-darker;
  home.file.".local/share/icons/Nordic-darker".source = ../../assets/kde-theme-custom/folders/Nordic-darker;
  home.file.".icons/Nordic-cursors".source = ../../assets/kde-theme-custom/cursors/Nordic-cursors;

}
