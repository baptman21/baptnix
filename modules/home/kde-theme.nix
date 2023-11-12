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
      secondary = "#03336D";
      primary_rgb = "4,88,207";
    };
    typhoon = {
      primary = "#a51fff";
      secondary = "#5E1191";
      primary_rgb = "165,31,255";
    };
    whirlwind = {
      primary = "#11d116";
      secondary = "#09730d";
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

  NordicDarkerGit = pkgs.stdenv.mkDerivation {
    name = "nordic-darker";

    src = pkgs.fetchFromGitHub {
      owner = "EliverLara";
      repo = "Nordic";
      rev = "master";
      sha256 = "sha256-cH/ZWZxKuJOPUafinAyX7/CrUfpo+lWGX7HraIYPsUU=";
    };

    nativeBuildInputs = [ ];

    buildPhase = ''
      cp -r $src ./Nordic

      chmod u+w -R ./Nordic

      cp -r ${../../assets/kde-theme-custom/layouts} ./Nordic/kde/plasma/look-and-feel/Nordic-darker/contents/layouts

      cp -r ./Nordic $out
    '';
  };

  NordicDarkerKdeGit = pkgs.stdenv.mkDerivation {
    name = "nordic-darker";

    src = pkgs.fetchFromGitHub {
      owner = "EliverLara";
      repo = "Nordic-kde";
      rev = "master";
      sha256 = "sha256-td3zATfLCEbz48QNR0GYyMB5TuOg9XkpbmebT1pznkw=";
    };

    nativeBuildInputs = [ pkgs.gzip ];

    # Replace the color by the theme color in the svg of the theme
    buildPhase = ''
      cp -r $src ./Nordic

      chmod u+w -R ./Nordic

      mkdir tmp
      mv ./Nordic/widgets/*.svg  ./tmp/
      gunzip -S .svgz ./Nordic/widgets/*.svgz

      sed -i 's/#8fbcbb/${colors.${theme}.secondary}/g' ./Nordic/widgets/* ./tmp/*

      gzip -S .svgz ./Nordic/widgets/*
      mv ./tmp/* ./Nordic/widgets/

      mv ./Nordic $out
    '';
  };
in
{
  home.file.".local/share/color-schemes/NordicDarker.colors".source = colors_with_theme;
  home.file.".local/share/konsole/Laconia.colorscheme".source = ../../assets/kde-theme-custom/konsole/Laconia.colorscheme;

  home.file.".local/share/plasma/desktoptheme/Nordic-darker".source = NordicDarkerKdeGit;

  home.file.".local/share/aurorae/themes/Nordic".source = NordicDarkerGit + "/kde/aurorae/Nordic";
  home.file.".local/share/plasma/look-and-feel/Nordic-darker".source = NordicDarkerGit + "/kde/plasma/look-and-feel/Nordic-darker";
  home.file.".local/share/icons/Nordic-darker".source = NordicDarkerGit + "/kde/folders/Nordic-darker";
  home.file.".icons/Nordic-cursors".source = NordicDarkerGit + "/kde/cursors/Nordic-cursors";

}
