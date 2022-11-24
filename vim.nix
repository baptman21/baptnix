{ }:
# Vim configuration
{
  enable = true;
  extraConfig = builtins.readFile ./config/vimrc;
}
