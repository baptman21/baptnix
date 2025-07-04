{ theme }:
# KDE Them configuration
#
# Args:
# - theme: one of tempest, whirlwind
#
let
  shared_colors = {
    bg0 = "#282c34";
    bg1 = "#31353f";
    bg2 = "#393f4a";
    bg3 = "#3b3f4c";
  };
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
      secondary = "#14b318";
      primary_rgb = "17,209,22";
    };
  };
in { config, pkgs, ... }:
let
  colors_with_theme = pkgs.replaceVars
    ../../assets/kde-theme-custom/colorschemes/NordicDarker.colors.tmpl {
      theme_color = colors.${theme}.primary_rgb;
    };

  NordicDarkerGit = pkgs.stdenv.mkDerivation {
    name = "nordic-darker";

    src = pkgs.fetchFromGitHub {
      owner = "EliverLara";
      repo = "Nordic";
      rev = "17ccf8703bfaf1149c329e8b54b1e34d4955221a";
      sha256 = "sha256-BEmVBVVG+GZxfmJEhwSCeDZva9J10FW0cvUyAGak0Vs=";
    };

    nativeBuildInputs = [ ];

    buildPhase = ''
      echo LS $src
      ls $src
      echo LS

      cp -r $src ./Nordic

      chmod u+w -R ./Nordic

      cp -r ${
        ../../assets/kde-theme-custom/layouts
      } ./Nordic/kde/plasma/look-and-feel/Nordic-darker/contents/layouts

      rm ./Nordic/kde/folders/Nordic-bluish/Places/32/mail-sent.svg
      rm ./Nordic/kde/folders/Nordic-bluish/Places/22/mail-sent.svg
      rm ./Nordic/kde/folders/Nordic-bluish/Places/16/mail-sent.svg
      rm ./Nordic/kde/folders/Nordic-bluish/Places/16/library-podcast.svg
      rm ./Nordic/kde/folders/Nordic-darker/Places/32/mail-sent.svg
      rm ./Nordic/kde/folders/Nordic-darker/Places/22/mail-sent.svg
      rm ./Nordic/kde/folders/Nordic-darker/Places/16/mail-sent.svg
      rm ./Nordic/kde/folders/Nordic-darker/Places/16/library-podcast.svg
      rm ./Nordic/kde/folders/Nordic-green/Places/32/mail-sent.svg
      rm ./Nordic/kde/folders/Nordic-green/Places/22/mail-sent.svg
      rm ./Nordic/kde/folders/Nordic-green/Places/16/mail-sent.svg
      rm ./Nordic/kde/folders/Nordic-green/Places/16/library-podcast.svg

      cp -r ./Nordic $out
    '';
  };

  NordicDarkerKdeGit = pkgs.stdenv.mkDerivation {
    name = "nordic-darker-kde";

    src = pkgs.fetchFromGitHub {
      owner = "EliverLara";
      repo = "Nordic-kde";
      rev = "5078055624735a48699c758aa55edec5fd859e48";
      sha256 = "sha256-NJTF8v1MjXBOmEX/YmUpMeRrtlOOVOljNQZzOw5p4OE=";
    };

    nativeBuildInputs = [ pkgs.gzip ];

    # Replace the color by the theme color in the svg of the theme
    buildPhase = ''
      cp -r $src ./Nordic

      chmod u+w -R ./Nordic

      mkdir tmp
      mv ./Nordic/widgets/*.svg  ./tmp/
      gunzip -S .svgz ./Nordic/widgets/*.svgz

      sed -i 's/#8fbcbb/${
        colors.${theme}.secondary
      }/g' ./Nordic/widgets/* ./tmp/*
      sed -i 's/#2e3440/${shared_colors.bg0}/g' ./Nordic/widgets/* ./tmp/*
      sed -i 's/#3b4252/${shared_colors.bg1}/g' ./Nordic/widgets/* ./tmp/*
      sed -i 's/#434c5e/${shared_colors.bg2}/g' ./Nordic/widgets/* ./tmp/*
      sed -i 's/#4c566a/${shared_colors.bg3}/g' ./Nordic/widgets/* ./tmp/*

      gzip -S .svgz ./Nordic/widgets/*
      mv ./tmp/* ./Nordic/widgets/

      mv ./Nordic $out
    '';
  };
in {
  config = {
    home.file.".local/share/color-schemes/NordicDarker.colors".source =
      colors_with_theme;
    home.file.".local/share/konsole/Laconia.colorscheme".source =
      ../../assets/kde-theme-custom/konsole/Laconia.colorscheme;

    home.file.".local/share/plasma/desktoptheme/Nordic-darker".source =
      NordicDarkerKdeGit;

    home.file.".local/share/aurorae/themes/Nordic".source = NordicDarkerGit
      + "/kde/aurorae/Nordic";
    home.file.".local/share/plasma/look-and-feel/Nordic-darker".source =
      NordicDarkerGit + "/kde/plasma/look-and-feel/Nordic-darker";
    home.file.".local/share/icons/Nordic-darker".source = NordicDarkerGit
      + "/kde/folders/Nordic-darker";
    home.file.".icons/Nordic-cursors".source = NordicDarkerGit
      + "/kde/cursors/Nordic-cursors";
  };
}
