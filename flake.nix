{
  description = "Baptnix configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager }@inputs:
    let
      system = self.system;

      lib = nixpkgs.lib;

      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      location = "$HOME/Baptcave/baptnix";
    in
    {
      nixosConfigurations = import ./hosts { inherit inputs location lib pkgs system; };

      homeConfigurations = import ./home.nix { inherit inputs lib pkgs system; };
    };
}
