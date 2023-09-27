{ inputs, lib, pkgs, system, ... }:
let
  mkHome = modules:
    inputs.home-manager.lib.homeManagerConfiguration {
      inherit pkgs modules;
    };
in
{
  baptman = mkHome [ ./homes/baptman.nix ];
}
