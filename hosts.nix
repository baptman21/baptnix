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
  rocinante = mkHost {
    name = "rocinante";
    inherit system;
    modules = [ ./hosts/rocinante.nix ];
  };

  tempest = mkHost {
    name = "tempest";
    inherit system;
    modules = [ ./hosts/tempest.nix ];
  };
}
