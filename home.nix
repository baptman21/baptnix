{ inputs, location, lib, pkgs, system, ... }:
let
  mkHome = imports:
    {
      inherit pkgs imports;
      # Home Manager needs a bit of information about you and the
      # paths it should manage.
      home.username = "baptman";
      home.homeDirectory = "/home/baptman";

      programs = {
        # Let Home Manager install and manage itself.
        home-manager.enable = true;
        bash.enable = true;
      };
    };
in
{
  baptcomp = mkHome [ ./hosts/baptcomp/home.nix ];
}
