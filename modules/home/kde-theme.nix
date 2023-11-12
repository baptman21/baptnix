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
  home.file.".local/share/aurorae/themes/Nordic".source = ../../assets/kde-theme-custom/aurorae;
  home.file.".local/share/color-schemes/Nordic.colors".source = ../../assets/kde-theme-custom/colorschemes/NordicDarker.colors;
  home.file.".local/share/konsole/Nordic.colorscheme".source = ../../assets/kde-theme-custom/konsole/Nordic.colorscheme;
  home.file.".local/share/Kvantum/Nordic".source = ../../assets/kde-theme-custom/kvantum/Nordic-Darker;
  home.file.".local/share/plasma/look-and-feel/com.github.eliverlara.nordic".source = ../../assets/kde-theme-custom/plasma/look-and-feel/Nordic-darker;
  home.file.".local/share/sddm/themes/Nordic".source = ../../assets/kde-theme-custom/sddm/Nordic-darker;
}
