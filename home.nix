{ inputs, outputs, importPkgs, ... }:
let
  mkHome = { pkgs, modules }:
    inputs.home-manager.lib.homeManagerConfiguration { inherit pkgs modules; };
in {
  tempest = mkHome {
    modules = [ ./homes/tempest.nix ];
    pkgs = importPkgs { system = "x86_64-linux"; };
  };
  typhoon = mkHome {
    modules = [ ./homes/typhoon.nix ];
    pkgs = importPkgs { system = "x86_64-linux"; };
  };
  whirlwind = mkHome {
    modules = [ ./homes/whirlwind.nix ];
    pkgs = importPkgs { system = "x86_64-linux"; };
  };

  cant = mkHome {
    modules = [ ./homes/cant.nix ];
    pkgs = importPkgs { system = "x86_64-linux"; };
  };
}
