{ system, inputs, location, lib, pkgs, ... }:
# Configuration for baptcomp laptop
let
  host = {
    hostName = "baptcomp3";
    mainMonitor = "eDP-1";
  };

in
inputs.nixpkgs.lib.nixosSystem {
  inherit system;

  specialArgs = {
    inherit host inputs location system;
  };

  modules = [
    ./baptcomp
    ./configuration.nix
  ];
}
