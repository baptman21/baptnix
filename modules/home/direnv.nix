{ config, pkgs, ... }:
# Config for direnv
{
  config = { programs.direnv = { enable = true; }; };
}
