{ config, pkgs, ... }:
# Vim configuration
let
  vim-spell-fr-utf8-dictionary = builtins.fetchurl {
    url = "http://ftp.vim.org/vim/runtime/spell/fr.utf-8.spl";
    sha256 = "abfb9702b98d887c175ace58f1ab39733dc08d03b674d914f56344ef86e63b61";
  };
in
{
  programs.vim = {
    enable = true;
    extraConfig = builtins.readFile ../../assets/config/vim/vimrc;
  };
  # French dictionary
  home.file.".vim/spell/fr.utf-8.spl".source = vim-spell-fr-utf8-dictionary;
  # Vim files in home
  # Settings for CocNvim plugin
  home.file.coc-settings = {
    text = builtins.readFile ../../assets/config/vim/coc-settings.json;
    target = ".vim/coc-settings.json";
  };
  # Vim plug to install other plugins, I currently prefer to rely on vim-plug
  # rather than pkgs.vimPlugins, it is easier for me.
  home.file.vim_plug = {
    source = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim";
      sha256 = "sha256-4tvXyNcyrnl+UFnA3B6WS5RSmjLQfQUdXQWHJ0YqQ/0=";
    };
    target = ".vim/autoload/plug.vim";
  };
}
