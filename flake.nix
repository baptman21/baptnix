{
  description = "Baptnix configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixpkgs_release_22_11.url = "github:nixos/nixpkgs/release-22.11";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs_release_22_11, home-manager }@inputs:
    let
      system = "x86_64-linux";

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
