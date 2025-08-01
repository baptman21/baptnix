{ config, pkgs, ... }:
# Vim configuration
let
  vim-spell-fr-utf8-dictionary = builtins.fetchurl {
    url = "https://www.mirrorservice.org/pub/vim/runtime/spell/fr.utf-8.spl";
    sha256 = "abfb9702b98d887c175ace58f1ab39733dc08d03b674d914f56344ef86e63b61";
  };
in {
  config = {
    home.packages = [ pkgs.ripgrep ];

    programs.vim = {
      enable = true;
      extraConfig = builtins.readFile ../../assets/config/vim/vimrc;
    };
    # French dictionary
    home.file.".vim/spell/fr.utf-8.spl".source = vim-spell-fr-utf8-dictionary;
    # Vim files in home
    # Settings for CocNvim plugin
    home.file.".vim/coc-settings.json".source =
      ../../assets/config/vim/coc-settings.json;
    # Vim plug to install other plugins, I currently prefer to rely on vim-plug
    # rather than pkgs.vimPlugins, it is easier for me.
    home.file.vim_plug = {
      source = pkgs.fetchurl {
        url =
          "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim";
        sha256 = "sha256-wtiZhGmgSaUSJacRKKEpF7N5gi0WtjlJPinqAth4cwY";
      };
      target = ".vim/autoload/plug.vim";
    };
    # FTPlugin files
    home.file.".vim/ftplugin".source = ../../assets/config/vim/ftplugin;
    # Lightline color scheme
    home.file.".vim/autoload/lightline".source =
      ../../assets/config/vim/autoload/lightline;
  };
}
