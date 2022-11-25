{ pkgs }:
# Files to add to the home dir
{
  # Vim files in home
  # Settings for CocNvim plugin
  coc-settings = {
    text = builtins.readFile ./assets/config/coc-settings.json;
    target = ".vim/coc-settings.json";
  };
  # Vim plug to install other plugins, I currently prefer to rely on vim-plug
  # rather than pkgs.vimPlugins, it is easier for me.
  vim_plug = {
    source = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim";
      sha256 = "sha256-4tvXyNcyrnl+UFnA3B6WS5RSmjLQfQUdXQWHJ0YqQ/0=";
    };
    target = ".vim/autoload/plug.vim";
  };
}
