{ inputs, location, lib, pkgs, system, ... }:

{
  baptcomp = import ./baptcomp.nix { inherit system inputs location lib pkgs; };
}
