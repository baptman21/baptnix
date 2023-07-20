{
  description = "Baptnix configuration";

  inputs = {
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    nixpkgs.url = "github:nixos/nixpkgs/release-23.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, unstable, home-manager }@inputs:
    let
      system = "x86_64-linux";

      lib = nixpkgs.lib;

      unstable = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [
          (import ./overlays/discord.nix)
          (final: prev: { inherit unstable; })
        ];
      };

      location = "$HOME/Baptcave/baptnix";
    in
    {
      nixosConfigurations = import ./hosts { inherit inputs location lib pkgs system; };

      homeConfigurations = import ./home.nix { inherit inputs lib pkgs system; };
    };
}
