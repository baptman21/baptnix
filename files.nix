{ pkgs }:
# Files to add to the home dir
{
  # Vim files in home
  coc-settings = {
    text = builtins.readFile ./config/coc-settings.json;
    target = ".vim/coc-settings.json";
  };
  vim_plug = {
    source = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim";
      sha256 = "sha256-4tvXyNcyrnl+UFnA3B6WS5RSmjLQfQUdXQWHJ0YqQ/0=";
    };
    target = ".vim/autoload/plug.vim";
  };
}
