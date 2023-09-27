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
  baptcomp = mkHost {
    name = "baptcomp3";
    inherit system;
    modules = [ ./hosts/baptcomp/host.nix ];
  };

  saturn = mkHost {
    name = "saturn";
    inherit system;
    modules = [ ./hosts/saturn/host.nix ];
  };
}
