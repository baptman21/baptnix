{ config, pkgs, ... }:
# Packages to install without any specific configuration
{

  config = {
    # Allow to install some binary outside of nix for npm and go
    home.sessionPath = [
      "$HOME/go/bin"
      "$HOME/.npm-global/bin"
      "$HOME/Library/Application Support/Coursier/bin"
    ];

    home.packages = [
      # Shell utilities
      pkgs.tree
      pkgs.bat
      pkgs.file
      pkgs.coreutils
      pkgs.gnugrep
      pkgs.ripgrep
      pkgs.ranger
      pkgs.unzip
      pkgs.xclip
      pkgs.bc

      # Abstraction over nix for package management in projects
      pkgs.devbox

      pkgs.pre-commit

      # Node
      pkgs.nodejs

      # Java
      pkgs.jdk21

      # Nix formatter
      pkgs.nixpkgs-fmt

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
      pkgs.yq

      # Git/github
      pkgs.gh # github cli

      # Hashicorp stuff
      pkgs.unstable.terraform
      pkgs.unstable.vault-bin
      pkgs.terraform-ls

      # Openssl
      pkgs.openssl

      # Python
      pkgs.ruff
      pkgs.unstable.poetry
      pkgs.unstable.uv
      pkgs.python310

      # Go
      pkgs.go
      pkgs.golint

      # Rust
      pkgs.cargo
      pkgs.rustc

      # Postgres
      pkgs.postgresql

      # Kubernetes
      pkgs.kubectl
      pkgs.kubernetes-helm
      pkgs.kubernetes-helmPlugins.helm-diff
      pkgs.kubectx
      pkgs.kubectl-neat
      pkgs.kubectl-node-shell
      pkgs.kubectl-view-secret
      pkgs.kube-linter

      pkgs.go-jsonnet
      pkgs.jsonnet-bundler

      pkgs.coursier
    ];
    #
  };
}
