{ config, pkgs, ... }:
# Packages to install
{
  home.packages = [
    # Shell utilities
    pkgs.tree
    pkgs.bat
    pkgs.file

    # Node
    pkgs.nodejs

    # Java
    pkgs.openjdk17

    # Nix formatter
    pkgs.nixpkgs-fmt
    pkgs.rnix-lsp

    # Npm
    pkgs.nodePackages.npm
    pkgs.nodePackages.pnpm

    # yaml formatter
    pkgs.nodePackages.markdownlint-cli

    # C/C++
    pkgs.clang-tools_14
    pkgs.gcc.out
    pkgs.glib.out

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

    # Zip
    pkgs.ark

    # Go
    pkgs.go

    # Postgres
    pkgs.postgresql
  ];

  home.sessionVariables = {
    # for c++ and libmagic (in that order)
    LD_LIBRARY_PATH = "$LD_LIBRARY_PATH:${pkgs.stdenv.cc.cc.lib}/lib:${pkgs.file}/lib";
  };
}
