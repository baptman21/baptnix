{ config, pkgs, ... }:
# Packages to install
{
  home.packages = [
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

    # C/C++
    pkgs.clang-tools_14
    pkgs.gcc.out

    # Sound
    pkgs.pulseaudio

    # Json
    pkgs.jq

    # Python
    pkgs.poetry
    pkgs.python310

    pkgs.google-chrome

    pkgs.slack
    pkgs.discord

    pkgs.spotify
  ];
}
