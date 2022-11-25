{ pkgs }:
# Packages to install
[
  # Shell utilities
  pkgs.tree
  pkgs.bat

  # Node
  pkgs.nodejs

  # Nix formatter
  pkgs.nixpkgs-fmt
  pkgs.rnix-lsp

  # yaml formatter
  pkgs.nodePackages.markdownlint-cli

  # Json
  pkgs.jq
]
