{ config, pkgs, ... }:
# Packages to install without any specific configuration
{
  home.packages = [
    # Shell utilities
    pkgs.tree
    pkgs.bat
    pkgs.file
    pkgs.coreutils
    pkgs.gnugrep
    pkgs.ranger
    pkgs.unzip
    pkgs.xclip

    pkgs.pre-commit

    # VLC
    pkgs.vlc

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
    pkgs.gnumake
    pkgs.clang-tools_14
    pkgs.gcc.out
    pkgs.glib.out

    # Json
    pkgs.jq

    # Hashicorp stuff
    pkgs.terraform
    pkgs.vault-bin
    pkgs.terraform-ls

    # Openssl
    pkgs.openssl

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

    # Rust
    pkgs.cargo
    pkgs.rustc

    # Postgres
    pkgs.postgresql
  ];
}
