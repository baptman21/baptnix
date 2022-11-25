{ pkgs }:
# Packages to install
[
  pkgs.nodejs

  # Nix formatter
  pkgs.nixpkgs-fmt
  pkgs.rnix-lsp
]
