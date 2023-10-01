{ inputs, lib, pkgs, system, ... }:
let
  mkHost = { name, system, modules }:
    let

    in
    inputs.nixpkgs.lib.nixosSystem {
      inherit system;

      specialArgs = { inherit inputs system; };

      modules = [
        {
          networking.hostName = "${name}";
        }
        /etc/nixos/hardware-configuration.nix
        ./hosts/shared.nix
      ] ++ modules;
    };
in
{
  whirlwind = mkHost {
    name = "whirlwind";
    inherit system;
    modules = [ ./hosts/whirlwind.nix ];
  };

  typhoon = mkHost {
    name = "typhoon";
    inherit system;
    modules = [ ./hosts/typhoon.nix ];
  };

  tempest = mkHost {
    name = "tempest";
    inherit system;
    modules = [ ./hosts/tempest.nix ];
  };
}
