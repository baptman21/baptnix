{ inputs, outputs, importPkgs, ... }:
let
  mkHost = { name, system, pkgs, modules }:
    inputs.nixpkgs.lib.nixosSystem {
      inherit system pkgs;

      specialArgs = { inherit inputs system; };

      modules = [
        { networking.hostName = "${name}"; }
        /etc/nixos/hardware-configuration.nix
        ./hosts/shared.nix
      ] ++ modules;
    };
in {
  whirlwind = mkHost {
    name = "whirlwind";
    system = "x86_64-linux";
    pkgs = importPkgs { system = "x86_64-linux"; };
    modules = [ ./hosts/whirlwind.nix ];
  };

  typhoon = mkHost {
    name = "typhoon";
    system = "x86_64-linux";
    pkgs = importPkgs { system = "x86_64-linux"; };
    modules = [ ./hosts/typhoon.nix ];
  };

  tempest = mkHost {
    name = "tempest";
    system = "x86_64-linux";
    pkgs = importPkgs { system = "x86_64-linux"; };
    modules = [ ./hosts/tempest.nix ];
  };
}
