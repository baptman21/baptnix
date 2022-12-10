{ inputs, lib, pkgs, system, ... }:
let
  mkHome = modules:
    inputs.home-manager.lib.homeManagerConfiguration {
      inherit pkgs modules;
    };
in
{
  baptcomp = mkHome [ ./hosts/baptcomp/home.nix ];
}
