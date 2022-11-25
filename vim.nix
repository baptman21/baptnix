{ pkgs }:
# Vim configuration
{
  enable = true;
  extraConfig = builtins.readFile ./assets/config/vimrc;
}
