{
  description = "Baptnix configuration";

  inputs = {
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    nixpkgs.url = "github:nixos/nixpkgs/release-24.05";

    nixpkgs_teleport_12.url = "github:nixos/nixpkgs?rev=857636b0327ad7e092ec6cbd71a7735c885cbebd";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, unstable, nixpkgs_teleport_12, home-manager }@inputs:
    let
      system = "x86_64-linux";

      lib = nixpkgs.lib;

      unstable = import inputs.unstable {
        inherit system;
        config.allowUnfree = true;
      };

      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [
          (import ./overlays/discord.nix)
          (import ./overlays/teleport.nix { inherit inputs; })
          (final: prev: { inherit unstable; })
        ];
      };
    in
    {
      nixosConfigurations = import ./hosts.nix { inherit inputs lib pkgs system; };

      homeConfigurations = import ./home.nix { inherit inputs lib pkgs system; };
    };
}
