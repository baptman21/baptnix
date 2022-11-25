{ pkgs }:
# Packages to install
[
  pkgs.nodejs

  # Nix formatter
  pkgs.nixpkgs-fmt
  pkgs.rnix-lsp

  # yaml formatter
  pkgs.nodePackages.markdownlint-cli

  # Json
  pkgs.jq
]
