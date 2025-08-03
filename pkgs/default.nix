{ pkgs, ... }:
# Packages
{
  awsexport = pkgs.callPackage ./aws-export.nix { };
  lib = pkgs.callPackage ./lib { };
}
