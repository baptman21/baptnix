{
  description = "Baptnix configuration";

  inputs = {
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    nixpkgs.url = "github:nixos/nixpkgs/release-25.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, unstable, home-manager, nix-darwin }@inputs:
    let
      inherit (self) outputs;

      lib = nixpkgs.lib;

      importPkgs = { system, overlaysOverride ? null }:
        # Import pkgs
        # With lazyness, this will only be done once per system. Most will use
        # the same pkgs.
        import nixpkgs {
          inherit system;
          config.allowUnfree = true;
          overlays = if overlaysOverride == null then [
            (import ./overlays/discord.nix)
            (import ./overlays/unstable.nix { inherit inputs; })
          ] else
            overlaysOverride;
        };
    in {
      nixosConfigurations =
        import ./hosts.nix { inherit inputs outputs lib importPkgs; };

      homeConfigurations =
        import ./home.nix { inherit inputs outputs lib importPkgs; };

      darwinConfigurations =
        import ./darwin.nix { inherit inputs outputs lib importPkgs; };
    };
}
