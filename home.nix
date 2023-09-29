{ inputs, lib, pkgs, system, ... }:
let
  mkHome = modules:
    inputs.home-manager.lib.homeManagerConfiguration {
      inherit pkgs modules;
    };
in
{
  tempest = mkHome [ ./homes/tempest.nix ];
  whirlwind = mkHome [ ./homes/whirlwind.nix ];
}
