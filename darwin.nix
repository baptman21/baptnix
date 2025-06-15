{ inputs, outputs, importPkgs, ... }:
let
  mkDarwinHost = { name, system, pkgs, modules }:
    inputs.nix-darwin.lib.darwinSystem {
      inherit system pkgs;

      specialArgs = { inherit inputs; };

      modules = [
	# TODO: add shared module if needed
      ] ++ modules;
    };
in {
  storm = mkDarwinHost {
    name = "storm";
    system = "aarch64-darwin";
    pkgs = importPkgs { system = "aarch64-darwin"; };
    modules = [
      ./darwin/storm.nix
      inputs.home-manager.darwinModules.home-manager
      ({
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users."baptiste.bourdet" = ./homes/storm.nix;
      })
    ];

  };
}
